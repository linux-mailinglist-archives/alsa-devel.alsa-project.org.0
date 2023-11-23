Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C235B7F5554
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 01:27:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC4DDEC;
	Thu, 23 Nov 2023 01:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC4DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700699241;
	bh=M5GDyE4zSQHOMo2VmEGb9eJcwSsa+CIf5IyoPYCZygg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MuzyG75j8RP0G7ycRrtoRFMWMmj6TIMc5oLLq2uArmBmluTFTXT8AHlmd9a1jDyDw
	 dyKEiMjTSXaC6pe9d69GtrnYlbu81W9SGRrWpQJrR/CKZpjOS36eCTZoiUPghBDPLc
	 sBZKaELXnMQo48iyUCom7eISjAdzAkBYyliwuUAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B54AF8057E; Thu, 23 Nov 2023 01:26:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15736F80578;
	Thu, 23 Nov 2023 01:26:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFBAEF802E8; Thu, 23 Nov 2023 01:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7931F80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 01:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7931F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NrtdkBBs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700698930;
	bh=M5GDyE4zSQHOMo2VmEGb9eJcwSsa+CIf5IyoPYCZygg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NrtdkBBs015WyelROXUBRNgCnLIY6y49tPIx5poCTLUzO6lSBg0XPb09wKF0e9ls8
	 3HRRMFU+c496ylfCFx8L0CsJ0Bqw8zQvgEdN7LAYDlyvX7lcYoilEDVIX+ZKWKG+BD
	 9lobJYHa2i9iecS6QXHAf0rOhx4mqUjyrlb0Ff3evLSLFa0dM1aZ/k2dBIc+5v577Z
	 DSUXn5/q04RF7KyPazlXG3sW3EeCZTV85iBJa+SciiMYz+C4241fXmm3OnLuklz61n
	 Avp0X4UQ5uo/MejgVOB932Vz1GNvmB1TUWBca7fMR7gcSLO8EGTV/QrZbTEIbCizyj
	 0zJF4jegbfWhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbJhc08sZz4x1p;
	Thu, 23 Nov 2023 11:22:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, james.schulman@cirrus.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, paul.gortmaker@windriver.com
Subject: Re: [PATCH 2/2] ASoC: cs4270: Remove unused codec
In-Reply-To: <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
 <20231122062712.2250426-2-mpe@ellerman.id.au>
 <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
Date: Thu, 23 Nov 2023 11:22:07 +1100
Message-ID: <877cm9s4i8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 6H62MDGJLDI5BKNDMUEFL45QEGUDUVFN
X-Message-ID-Hash: 6H62MDGJLDI5BKNDMUEFL45QEGUDUVFN
X-MailFrom: mpe@ellerman.id.au
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H62MDGJLDI5BKNDMUEFL45QEGUDUVFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mark Brown <broonie@kernel.org> writes:
> On Wed, Nov 22, 2023 at 05:27:12PM +1100, Michael Ellerman wrote:
>> The only driver to enable SND_SOC_CS4270 was SND_SOC_MPC8610_HPCD, which
>> was dropped in the preceding commit. Remove the codec as unused.
>
> There's no real overhead from having extra drivers and we do have
> generic drivers that people can attach CODECs to.

OK. I have no idea how sound works, I was just cleaning things up. So
whatever you think is best.

cheers
