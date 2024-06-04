Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3D9077DF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E81EB14F2;
	Thu, 13 Jun 2024 18:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E81EB14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294953;
	bh=iEIJ1ODrXLu8gKKalSPXoQUGalwH+oelgUDRq8s7R8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SCH/r7HWyLXdvaMaFbMU1ZFGQa4m5cCDGRCnePEm7Mrq54H1o+6oiVmTs+iUfhfer
	 PgI4PLEPmUCTCirJjE+q2rGnR2TAgqxjiKSRn2BiGFynIsG1h/VwFKfSAXB1AvOXfW
	 Zuov4zs+guJkBCjgokJh+KDKydS4B+FKV2hpB4PM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0FD9F806A0; Thu, 13 Jun 2024 18:03:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0971DF8972B;
	Thu, 13 Jun 2024 18:03:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17A6CF802DB; Tue,  4 Jun 2024 21:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB652F800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 21:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB652F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=manjaro.org header.i=@manjaro.org header.a=rsa-sha256
 header.s=2021 header.b=Ba5ZIYTy
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1717528850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=db/Sl9j482azBoAdhWtuIMKD0VB/oszgMwHPRWC6tXQ=;
	b=Ba5ZIYTySI0OuLOX2S8DKaSXYQyd9j7j3JkCIjtrrWomudObV6fdgaMIVW/Ns9dK+vDT7b
	IKCV09hJ1biUgpqpNTVRzilYMdTv5exJkRMPy3EC2SfxsQRFPSZgPhyLeYJ9psFPkg8eh8
	46FtGa+a4vrRYq8AFVi1Q2um/uVQGKkSy9kLziYw+RMOD8zVJb85fZM1sb5KJThJoTmkV4
	uPv5okFYbxu7f+Tozmna+NzaOZwz5xpmKzQCAXIJihfPNZrt1hyKIs6zVAFEoOFgnzV9el
	e17uEA/bczRWhCZifAiIlo671TRGXWpJJdHLebQsxct8qrb3wBDzlQxB2p4yiA==
Date: Tue, 04 Jun 2024 21:20:49 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
In-Reply-To: <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
 <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
Message-ID: <04bfcdd0088f521e4418a77e528652e3@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-MailFrom: dsimic@manjaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AMXWAAN52N5HAU6YLWCHMDB27JSO6UIL
X-Message-ID-Hash: AMXWAAN52N5HAU6YLWCHMDB27JSO6UIL
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMXWAAN52N5HAU6YLWCHMDB27JSO6UIL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-06-04 13:56, Mark Brown wrote:
> On Mon, Jun 03, 2024 at 05:16:07PM -0700, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> sound/soc/qcom/snd-soc-qcom-sdw.o
> 
> Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
> just seems like a huge amount of noise and I'm having trouble thinking
> of a use case.

FWIW, I find module descriptions useful.  Of course, there are
some of them that don't provide much value, but the well-written
ones are good.
