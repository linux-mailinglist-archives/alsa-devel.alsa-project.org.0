Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCD16A2271
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0666D1E0;
	Fri, 24 Feb 2023 20:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0666D1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677267694;
	bh=dxJ9OwJ4Yxn8rFPNZc3Z2H2yHUtHPds38dpBl7vM/NU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uX9GggOKNSYoNIzBbe2gUgh8PYYYnQZ4p2HECGQWy1N2yn8VyKR43znJzhPNU4LNx
	 P7KAQq3cekkf5TEi5Fj59RCFzvwD8XUHe9iJbZjRFMSn2CJpxbwiJ96ANwMK42Li+Y
	 p7d5krLpNyM/DeUt3iwReVna9ALnEtclgursI+PU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C23F80116;
	Fri, 24 Feb 2023 20:40:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B6BCF800C7; Fri, 24 Feb 2023 20:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74466F800C7
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74466F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=na0wWdZk
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDB4A6602FCE;
	Fri, 24 Feb 2023 19:40:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677267633;
	bh=dxJ9OwJ4Yxn8rFPNZc3Z2H2yHUtHPds38dpBl7vM/NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na0wWdZkVsc60hy1r5q3Wa/BCN8pIGwByZKv8BLqbtsjpLoO4uoQAfIAldSY3DgrG
	 imeYM9EqwANCtSRBvRcUTEQxuGYHfoS7cOvobSD0j1rhLdW0UtQ+TB9J/SOpT4+oSX
	 yiT4IJ3wLIUACNIY/Enzxgo9Y03hSwSu74w6m7Pdgqz2MyoN4ASwTZVuaS6rWRKkuP
	 Oos1jhht2gOWvBdXxj4+PPN6ptfcneJMDdVFqwFhal13bLK3+OnQ1OzzX2NoOqgvv5
	 XD+oa/JoLkVeCPeiLexOi4XD1tJKEzC0XxYNSGsvoWSY5nW/s3Oc9xzbkNnJKS1Y+m
	 qYMCjlg0Dvpag==
Date: Fri, 24 Feb 2023 14:40:27 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: mt8192: Fixes from initial glance at kselftest
 run
Message-ID: <20230224194027.fmazqn5wx6lhbw5u@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
Message-ID-Hash: 4WDBMNN5GJPKLPVXEGI4LDQD3KVNUT4E
X-Message-ID-Hash: 4WDBMNN5GJPKLPVXEGI4LDQD3KVNUT4E
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WDBMNN5GJPKLPVXEGI4LDQD3KVNUT4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 24, 2023 at 02:03:54PM +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the Spherion Chromebook on KernelCI.  There are
> more issues flagged, this is just what I fixed thus far - the volume
> controls on the MT6359 have issues for example, and a lot of controls
> aren't marked as Switches like they should be.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks for the fixes.

Tested on a spherion chromebook to make sure audio still works as expected, and
the following tests from mixer-test in the alsa kselftest are fixed:

	# No event generated for MTKAIF_ADDA6_ONLY Switch
	not ok 1910 event_missing.0.13

	# No event generated for MTKAIF_DMIC Switch
	not ok 1917 event_missing.0.12

	# No event generated for Sidetone_Positive_Gain_dB
	# Sidetone_Positive_Gain_dB.0 value -1 less than minimum 0
	# Sidetone_Positive_Gain_dB.0 value 101 more than maximum 100
	not ok 1930 write_invalid.0.10

(no change in pcm-test results)

So,

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
