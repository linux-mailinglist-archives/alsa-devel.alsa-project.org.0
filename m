Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67207F52FC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 23:08:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96AE5A4C;
	Wed, 22 Nov 2023 23:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96AE5A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700690931;
	bh=XiylAXhBpVr+an3yZa/AAXuHv5sQqB2KqKPuMEr8uF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pahlwfSb+QW8rmI8l25OWKDKl7MW3fUzJyHYRcmlDAQFhGwGogVj2LSRTTUqSuqlF
	 niYdDeVgBcZAG7i/FTve6IpIMGBAWeVvuAMC+pDzNwBlSW2EJKafYZ/fNqRTuf3gAO
	 BDZXb3985RLtHwGSH2aygwVPkx0qbHkzDZs2wQAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD94DF8055C; Wed, 22 Nov 2023 23:08:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16029F80578;
	Wed, 22 Nov 2023 23:08:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F20F802E8; Wed, 22 Nov 2023 23:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 821AFF80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 23:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821AFF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=Mnd4tWt3
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 6646016C0057;
	Thu, 23 Nov 2023 00:06:39 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Apnt0kEcJIAU; Thu, 23 Nov 2023 00:05:47 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1700690747; bh=XiylAXhBpVr+an3yZa/AAXuHv5sQqB2KqKPuMEr8uF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mnd4tWt3tHqZWLBIqfDpU3FEeIDS0A+ywNEmkOFMyfZgH7XMUVAdHN8QAPpTXpzg7
	 GD8sMgxSwgcPJ6rzkUtZNrXSKu2ejX3doIrUeQv3sEzsGTOz/bzDt3cw6tTnrYD84H
	 qWgFZpobQn/RnKtH0YN7CMrP2B2bAsfHtyYGIj1k=
To: syed saba kareem <ssabakar@amd.com>, Linux regressions mailing list
 <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, Syed
 Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Venkata Prasad Potturu
 <venkataprasad.potturu@amd.com>, V sujith kumar Reddy
 <Vsujithkumar.Reddy@amd.com>, ye xingchen <ye.xingchen@zte.com.cn>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops
 support for acp pci driver"
In-Reply-To: <6085d2e3-f28e-4d1d-9863-8275931430e6@amd.com>
References: <87a5v8szhc.fsf@mutex.one> <ZUQssoD2rUHSYQ2v@debian.me>
 <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
 <d002ad6f-d908-4cf6-afcf-bf0989418e72@leemhuis.info>
 <6085d2e3-f28e-4d1d-9863-8275931430e6@amd.com>
Date: Wed, 22 Nov 2023 23:55:24 +0200
Message-ID: <87fs0x4fn7.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: EEWCEKXKSL7IEAEGZHOPZ65L74MTD4OP
X-Message-ID-Hash: EEWCEKXKSL7IEAEGZHOPZ65L74MTD4OP
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEWCEKXKSL7IEAEGZHOPZ65L74MTD4OP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

syed saba kareem <ssabakar@amd.com> writes:

>
> Hi , We have up streamed the patch it is in review.
>
> Please find the below link for the patch details.
>
> https://patchwork.kernel.org/project/alsa-devel/patch/20231113123345.2196504-2-Syed.SabaKareem@amd.com/
>

Sorry maybe I'm not understanding here something, when you are saying
that the patch is in review, where is this review being done?

As far as I can tell Mark Brown only pulled the first patch from your
series:

>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/2] ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
>       commit: d3534684ada99ef8c0899eb28c62b4462483ee19
> [2/2] ASoC: amd: acp: add pm ops support for renoir platform
>       (no commit info)
>

I don't see the second patch in for-next.
