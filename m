Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244A816A3D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 10:52:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF696DF6;
	Mon, 18 Dec 2023 10:52:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF696DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702893134;
	bh=FmaCO3wtJYJhExGyeV79viD3s/bYDN671VCwnX/sC8o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VAJYebt6s2m/1wd/lnH358Yh45Gw5EhLyng3q4VdA/tI85Y+VwF3oC5PnaberDKDb
	 wrkrs36u41Me7vuvX6FhPzJ5/K97ajGdK5YCjN6e90HkHL+gH4VqE9rRG/DeGwDlE8
	 rHF3eZbruUhxsVoSB8YMW7T3JjJANN30HCr+7pDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CD0F8057A; Mon, 18 Dec 2023 10:51:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEE8F800D2;
	Mon, 18 Dec 2023 10:51:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68449F80425; Mon, 18 Dec 2023 10:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DAF0F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 10:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DAF0F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=HyHheC1v
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2EB359C33AB;
	Mon, 18 Dec 2023 04:49:12 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id s6ZKCH3O2aXC; Mon, 18 Dec 2023 04:49:11 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 845349C3346;
	Mon, 18 Dec 2023 04:49:11 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 845349C3346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702892951; bh=3NZgtEjTStQ/jkKNdfYik4JJQNYF7QsQDfiVemLglq0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HyHheC1vBfTJZ0kyKTmzxPSomAhy4RyySgCvLGz8Z0k4+9VvPoJIUQaI+jwLrARBo
	 CCi8JBr2svVlQaxcrS0uqnPPlwu/o3FmAxE5pzI88Cdq8ScMBvgZg/4M7mL/vZW/l3
	 G6CuzJteO3d8jF2AhylH3RRQLVHFsD2v6je4vggWSfx6i8Mjd5OsHfgKK57b5iXxsP
	 Athk2Zuf8im3sOYJlyXkng56xqhClbmneHwR6wLY5XqrxDRrIA2TslJHfA+jQvcawR
	 qHP+bkKsnd2Q3cZiTCSlOagtGedzim5AgkAxO6HevBMivGTzvsestA1tIUFd8q5KlD
	 Uyubo7VH/RQ0A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id XYt_5ncQDLll; Mon, 18 Dec 2023 04:49:11 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 38AC49C29FD;
	Mon, 18 Dec 2023 04:49:11 -0500 (EST)
Date: Mon, 18 Dec 2023 04:49:11 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu wang <shengjiu.wang@gmail.com>, Xiubo Lee <Xiubo.Lee@gmail.com>,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Message-ID: 
 <299362992.190017.1702892951148.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <d095614a-071c-4ee8-8e47-5bf073aaabea@kernel.org>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
 <20231215144005.934728-11-elinor.montmasson@savoirfairelinux.com>
 <d095614a-071c-4ee8-8e47-5bf073aaabea@kernel.org>
Subject: Re: [PATCHv3 10/10] ASoC: bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4562 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4570)
Thread-Topic: ASoC: bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: 1UupPn4f95lG/dGdK+HKOlbDdPS56g==
Message-ID-Hash: CWBIPQL3AWNO4U3OCF7AB2ERNMFYOMZK
X-Message-ID-Hash: CWBIPQL3AWNO4U3OCF7AB2ERNMFYOMZK
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWBIPQL3AWNO4U3OCF7AB2ERNMFYOMZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

> > Add documentation about new dts bindings following new support 
> > for compatible "fsl,imx-audio-generic". 
> 
> Please use subject prefixes matching the subsystem. You can get them for 
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory 
> your patch is touching. 

I saw that most of the commits use "ASoC: dt-bindings:" prefix, but
commits related to "fsl-asoc-card.txt" use "ASoC: bindings:" prefix.
Should I follow the general style or the file style ?


> Please use scripts/get_maintainers.pl to get a list of necessary people 
> and lists to CC. It might happen, that command when run on an older 
> kernel, gives you outdated entries. Therefore please be sure you base 
> your patches on recent Linux kernel. 
> 
> You missed at least devicetree list (maybe more), so this won't be 
> tested by automated tooling. Performing review on untested code might be 
> a waste of time, thus I will skip this patch entirely till you follow 
> the process allowing the patch to be tested. 
> 
> Please kindly resend and include all necessary To/Cc entries. 

Sorry for the mistake, I will resend patches with the correct list from
the get_maintainers.pl script.


> > Some CPU DAI don't require a real audio codec. The new compatible 
> > "fsl,imx-audio-generic" allows using the driver with codec drivers 
> > SPDIF DIT and SPDIF DIR as dummy codecs. 
> > It also allows using not pre-configured audio codecs which 
> > don't require specific control through a codec driver. 
> > 
> > The new dts properties give the possibility to set some parameters 
> > about the CPU DAI usually set through the codec configuration. 
> > 
> > Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com> 
> > Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com> 
> > --- 
> > .../bindings/sound/fsl-asoc-card.txt | 28 ++++++++++++++++++- 
> > 1 file changed, 27 insertions(+), 1 deletion(-) 
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt 
> > index 4e8dbc5abfd1..f137ef2154e3 100644 
> > --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt 
> > +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt 
> > @@ -17,6 +17,9 @@ Note: The card is initially designed for those sound cards who use AC'97, I2S 
> > and PCM DAI formats. However, it'll be also possible to support those non 
> > AC'97/I2S/PCM type sound cards, such as S/PDIF audio and HDMI audio, as 
> > long as the driver has been properly upgraded. 
> > + To use CPU DAIs that do not require a codec such as an S/PDIF controller, 
> > + or to use a DAI to output or capture raw I2S/TDM data, you can 
> > + use the compatible "fsl,imx-audio-generic". 
> > 
> > 
> > The compatible list for this generic sound card currently: 
> > @@ -48,6 +51,8 @@ The compatible list for this generic sound card currently: 
> > 
> > "fsl,imx-audio-nau8822" 
> > 
> > + "fsl,imx-audio-generic" 
> 
> Generic does not look like hardware specific.

Even if our end goal is to use it with the S/PDIF controller, this new
support can be used with different hardware that doesn't
require a codec. Thus, we don't really want to specify "spdif" in it.

Is this compatible string not suitable ?
Should we rename it to something else, like "fsl,imx-audio-no-codec" ?


Best regards,
Elinor Montmasson
