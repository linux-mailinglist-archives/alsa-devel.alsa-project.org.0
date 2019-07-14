Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B871A67F07
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jul 2019 14:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5746D1667;
	Sun, 14 Jul 2019 14:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5746D1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563108574;
	bh=JfUWif3Tfk4QZYLTXFI61ff8rDqVhoXoKhamMQrMWQw=;
	h=References:To:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILRC9+lx0IzPpp0ZcanDWP7wPkGB/F7cncxD/zoM6nIMK6e1dZ34g3aCl3nxXcBjj
	 KZhhTVG4TZYAvCTrvkUVbyELtXGFuARc/chr0t1LdTc5EUmDE5wSIFP3alitKLS7vO
	 yMW9FNv/h5yPaH7La+f1aRezEFapnWX3HFQ5ZdI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 776F6F800C8;
	Sun, 14 Jul 2019 14:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0A8CF80377; Sun, 14 Jul 2019 14:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55635F800D8
 for <alsa-devel@alsa-project.org>; Sun, 14 Jul 2019 14:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55635F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="X5Al4uIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1563108442;
 bh=Bv58aXwasISoukBgAwwIyQdm3DHnY22HSUajDGxRpUE=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=X5Al4uIle2ec6UTEliCb2RHjk1L7MXUIa8nKA7OJApxzBthvWfdBl2tQ2ktVYZM63
 ZYOw2tAW9qDolDVyH3qHYhVvqSbZhY3twptIOUIkyWVC4xEsIxNhQ7Kx7OS+N5hnwd
 pjKqmVwCVfpW5hBQAbj94loVCe1ejBalR+Uc14q8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.159.144]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LpNwf-1iRDWG3tJt-00fEQC; Sun, 14
 Jul 2019 14:47:22 +0200
References: <1562989575-33785-3-git-send-email-wen.yang99@zte.com.cn>
To: Wen Yang <wen.yang99@zte.com.cn>, alsa-devel@alsa-project.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4545ce50-493c-8faa-fdcd-5aee3ca30792@web.de>
Date: Sun, 14 Jul 2019 14:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1562989575-33785-3-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:ARMVCvM4n0fZixFkmnwA6Q1ueCcqChHYMLocwTvLTJOsT4zwMJv
 ZZnCMfu1tzzrYiauyKZXsAacRmYKQrienBCc8fSAk+ek+GEVJRon6ZzOKulL4F+hs5/WgWn
 IGpm/iS5E1T2oXDEeVpKgGYeuEcd7r4FWdca3cG44QQJthjHf3b8uOtYeddG6S3kNPE11BN
 a3GAoxdoqlR76h4N0fm6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X0JgI81HCiQ=:b1AbNe+rg82E6KQX5t8E79
 5zSJdOfuTQlVmM8AmskRMNiGnlJpg51hawdwWrK5Mcb/+KqAuIMXd194W7On4vkzDWgxChWQ9
 k63b9nSnQow/m/HqAVtwWDTnyTUWBrYyogk/8tNZMgNZ//NTBtAwVzrq2PUlQeUfPrTEPBzCQ
 ae6Y1ATsZWCC+JrhhAA+Ut8++VXTI3natF4PzcRzEKEyJ2SkmO1cagrhpR1EsloXg0x8xaJAM
 vn32F0GavgMGVEMmgCvGaMHvm4Hnjy0nzda7N46OdTKz6o9r1yvvh3H0fbpu8U/RIqjhpyFos
 MEM6M6rztpLUi4CoHoFeHOIssSRB6xcAsTPGBC2u78QjyJC6ZC6yQXLd+7LJWNuLsyk68NDtz
 dR8tF0wnbehTigWQPRwOEMbFWCEUDrZRd1AoCvg5kYH9Xy0zfoxklXChLSiYwHa923oNAIGvz
 +949uvZzuBDGMB9f6NjLR3BM1QnRSeb4hYx1kAQgoRMl97igVnXX0uAIcVv060aoWcGCLejZn
 TcrzN3W67SF5R2iw9ynfzopzE8oA9DhVjAZvAFb8tG+up6zpZUhKVMqWPgyoJ82bbIAJIGEWQ
 QxcRrSPo97ESH7ZhboGtPbjok1yhD8vKhFpecXw2ItkhcZhzMjzUgzo+XtKYzw7NVnGthBCcC
 9+I9zgo1LpiAZbpQx6yNyXX7x8YFXzsaJBb47vZTv7puDZn05ZIxWB5PICWDHIpiS4kDfgaEv
 /Mvmf0/UDUVLB+xoZu6MxMPl4VR4BbxxFIPkwOH+BGwRkTNjOBDelvnzJ50p5BBmHdq53pYsQ
 P/el6xziXo8Ab6qUhPGC7iJXU7zBm2x64svx93///tIy3O+8flX9p3YkkQ60Y+sIenZLjOTXH
 ER3o/otiiyNxo8qmnb/HxEVeJU9DLHWhMEUm4sM9PRds+ocv0Ppvt0FGxe5lU9kVwfHPGjaXC
 ZAENQi/u0vNkEwS+ha1JHZwpVGOrdKoFJH8ih2+wjIv0QvV/E9TROHcfmvv0RZOn8uXby/6H5
 RB6xCrHce52snfMCUmgXaILzPgNyVV1XV9WDtnGr6dZ4RrjhYD2op0XhehWLcYeztajYKxiOp
 BL5iaH3cFCQUndxf5CG71+G09lc4dBI3AaG
Cc: Yi Wang <wang.yi59@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Sangbeom Kim <sbkim73@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Cheng Shengyu <cheng.shengyu@zte.com.cn>
Subject: Re: [alsa-devel] [2/2] ASoC: samsung: odroid: fix a double-free
	issue for cpu_dai
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> The cpu_dai variable is still being used after the of_node_put() call,

Such an implementation detail is questionable.
https://wiki.sei.cmu.edu/confluence/display/c/MEM30-C.+Do+not+access+freed+memory


> which may result in double-free:

This consequence is also undesirable.
https://cwe.mitre.org/data/definitions/415.html


Now I wonder if two update steps are really appropriate as a fix
instead of using a single update step for the desired correction
in this software module.
Should a commit (including previous ones) usually be correct by itself?

Regards,
Markus
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
