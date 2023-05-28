Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597217138B3
	for <lists+alsa-devel@lfdr.de>; Sun, 28 May 2023 10:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331E6207;
	Sun, 28 May 2023 10:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331E6207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685262136;
	bh=aKE4vR5nPjGoOq0f/TuwqOi3Z598quGLgBKTEG63v9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fI5okTmG5lCRGvu5sEjxu2x90JVjY5Re1Pc0m+LSkgwm/qR0rLZZFxGKeenOEnycp
	 n2hR9ziGzX3f2tKGjzT9Nm2tPDvKWr9FBNeo6YCElIV6CjkZd02UmUknadAntO9C8L
	 A99EKbPvVBIJ2+cFxXbijYn2LRu1IGy7W9iNawg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C30F80510; Sun, 28 May 2023 10:21:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1262FF8026A;
	Sun, 28 May 2023 10:21:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1031F8042F; Sun, 28 May 2023 10:21:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr
 [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0A72F80149
	for <alsa-devel@alsa-project.org>; Sun, 28 May 2023 10:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A72F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=DQEUK0oI
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 3BeKq1PKadSC93BeKqPZEf; Sun, 28 May 2023 10:21:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1685262078;
	bh=nX3q8TDpBb44Pj2nFnyASQnvodZT+B9gU6eNR43xnl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DQEUK0oIC09BxB9jlyKZ8sOzTZvByKbvEPUKL3032w4l1PHPaVpMcrtBDxy8yvDgx
	 si0CX2bgGnK3a7TGQx03IsRvdOFXJ0xN4hoHOn1000htZQysdH0d1WiTKHJarY+B9c
	 RORF9Q8nt4XvMD01PDjHOgvun7z0EK741mqY3w28dzoidp2a4+KmsdUBVbKizJ4SOG
	 lUWbgsNVA68+Pp1S50KCDDhIarGKq4ZaPTyPu91y+htcNw7inwmqeVF76tNppa/rLw
	 P7UM9yfdazMUC2dk+Ad0t6ilJrMMyzxKegB4Jyb+Eb9UGd0SvdOYx5NIy8P1elzWh/
	 cMajQcBBMs8nw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 May 2023 10:21:18 +0200
X-ME-IP: 86.243.2.178
Message-ID: <ca50e56a-14c2-0c62-566e-cf00c0510529@wanadoo.fr>
Date: Sun, 28 May 2023 10:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 3/6] ASoC: tas2781: Add tas2781 driver
Content-Language: fr, en-CA
To: Shenghao Ding <13916275206@139.com>
Cc: Ryan_Chu@wistron.com, Sam_Wu@wistron.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org, gentuser@gmail.com,
 kevin-lu@ti.com, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, peeyush@ti.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org,
 shenghao-ding@ti.com, tiwai@suse.de, x1077012@ti.com
References: <20230527223537.9686-1-13916275206@139.com>
 <1eb0d507-2017-4057-272b-cb3c298fa990@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1eb0d507-2017-4057-272b-cb3c298fa990@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WM7SVAFRJA6FBHAS2NIAI6VIXQJNP4MW
X-Message-ID-Hash: WM7SVAFRJA6FBHAS2NIAI6VIXQJNP4MW
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WM7SVAFRJA6FBHAS2NIAI6VIXQJNP4MW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 28/05/2023 à 10:04, Christophe JAILLET a écrit :
> Stop reading here. There seems to be a mix-up with patch 4/6.

Ok, sound/soc/ vs sound/pci/

I guess that some comments done on 4/6 are also relevant for 3/6 (i've 
not rechecked)


> CJ
> 
> 

