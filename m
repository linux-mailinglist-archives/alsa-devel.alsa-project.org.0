Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847E96DF034
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 11:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F08E10B6;
	Wed, 12 Apr 2023 11:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F08E10B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681291377;
	bh=Ij5tGdQ5E/F9HYBnI40b+hnLie47H04UNhrTvvmkSxY=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hX8a9YklC5yq+RLFtsNtPFjp34vVot/7GhxzPJRzT51DSVzsnkxXTxcKqjE+4EM3w
	 Vc2EgTPE4wWj2zgwdjixTvadpLuDbTumHhQwrHQpnufl1gEL1polkT6UMEMFxXwU5M
	 ExzVcHP3qpOh1WW6hWEmu0NSx/Jkt8Kk3fQ8x5K4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6AEBF8025E;
	Wed, 12 Apr 2023 11:22:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCE1F8025E; Wed, 12 Apr 2023 11:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71ED4F800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 11:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71ED4F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=EEzjuPOk
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BEE719C2069
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 05:21:58 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id xKlclHa7i8fu; Wed, 12 Apr 2023 05:21:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 359E09C1178;
	Wed, 12 Apr 2023 05:21:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 359E09C1178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1681291318; bh=Ij5tGdQ5E/F9HYBnI40b+hnLie47H04UNhrTvvmkSxY=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=EEzjuPOk+0Azmghbn9PS1jcS7XKrDd46bCPxWqC9YAKNtOApdzREfqXkS3Hcur0iG
	 BJvJdU1pLqK+2H4mka0utPiOPNyaaw+4GozJVLdqeSbJjMgQpCehsuaMo1HomAp9oS
	 QAtYT5gpv6p4YotFFBytLBI3OSW99cK/zlFbshUqlsR8rtYZ91RnCQNQ7osvXy3B6n
	 hVbU6YPSOKy/Efh0Ni4hN8aMNN2BLFDhvLGx4EjMUobzpO4HY7IKgMmSZOpKfBfCKz
	 gkwJA0QorjfzLGf/6NQ5IVGxkt5zzIODFMt4Gzlf2N9FbHzTO4kAx0zvS+AYso64eS
	 3aG54cwMNDKDQ==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id HYLqrmvGk0ja; Wed, 12 Apr 2023 05:21:58 -0400 (EDT)
Received: from [192.168.216.94]
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D38459C0813;
	Wed, 12 Apr 2023 05:21:57 -0400 (EDT)
Message-ID: <28b67f03-fe02-3780-3bd3-5587fc6c284d@savoirfairelinux.com>
Date: Wed, 12 Apr 2023 11:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [question] ASoC: max98088: questions about dai2 usage
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SNXQWW2GDIVJM2XMFCMTI2EZIRTUO5C4
X-Message-ID-Hash: SNXQWW2GDIVJM2XMFCMTI2EZIRTUO5C4
X-MailFrom: philip-dylan.gleonec@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNXQWW2GDIVJM2XMFCMTI2EZIRTUO5C4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I'm currently working with a max98089 codec but could not reach the=20
module authors.

I'm currently trying to add routes from DAI2 to DAI1 through the LBEN2=20
multiplexer on the chip. My goal is to route data from a digital=20
microphone to the SoC connected to DAI1.

I've noticed that the driver already implements a route from DAI2 to the=20
DAC. I've tried re-using the DACL2 and DACR2 widgets to route them=20
through a DAPM mux, with no success. I noticed that other codecs use=20
DAPM_AIFIN/OUT widgets for I2S in/out, but the max98089 does not.
Should I use such widgets to implement the route ? Are they necessary to=20
implement a codec-to-codec (max98089 <-> microphone) link ?

In regards to the device tree, do you have examples using both the codec=20
DAI1 and DAI2 ?

Thanks for your support, and apologies if I misdirected this mail.

Regards,
--=20
Philip-Dylan Gleonec
Consultant en logiciel libre / Ing=C3=A9nieur syst=C3=A8mes embarqu=C3=A9=
s | Rennes, Fr
(+33) 9 72 46 89 80 <tel:+14185257354>
