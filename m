Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567F67E77
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jul 2019 12:09:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C573E1669;
	Sun, 14 Jul 2019 12:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C573E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563098971;
	bh=L652cIWm+TgISsQGQhQezPzDWUps2yRHR04RQ8S/qxE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PcDcstr/D5Mj4/6ghKESazgqFwGBxZrpsaKCDEPCsQvtgWOkiVUSjK4ckNx1EMOvE
	 NR+foQrdpgZyFjEtgm4DDXkQG3QouKSTMuGNeD2oncsME2JWjTFc/meyFMMDC+5mBt
	 MFDKUL28PVfJk6l2M4Oqp2lX898oKyIPxIMM742E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0BDF80390;
	Sun, 14 Jul 2019 12:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F9D3F80377; Sun, 14 Jul 2019 12:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21AFCF800D8
 for <alsa-devel@alsa-project.org>; Sun, 14 Jul 2019 12:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AFCF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="GwyrUOjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1563098842;
 bh=bXndHdPJ3jM5bQ1RKItkawRtER4ZAQycYeZkZqs1DWU=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=GwyrUOjtKxDTEfETGu4dHU4shEjLuNo1rZ1+tUgG/E9M1qX/NbNKUAH3bbfWhexla
 ZkWwPEnDFYV4rmwSDbobiJVrZmxSINVL6R9ZWmt4QEBVuws4KNDGvIL0mTpgs5JDCH
 Q/GzFz9CSb6tSA2I4WJtAh2cI3tmpmmMz7zKVm0Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.159.144]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MCZtW-1hdDUe20Pa-009QHP; Sun, 14
 Jul 2019 12:07:22 +0200
To: Wen Yang <wen.yang99@zte.com.cn>, alsa-devel@alsa-project.org
References: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <fbd5666c-f681-4f09-eb5c-35c47d60d857@web.de>
Date: Sun, 14 Jul 2019 12:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:5n2Rwt1HpiQQYgHOGVufp3KJuiq5qGuGoupTkQDnbXt19t2izfJ
 ilRmwUUcgkLWbfVu4ouAvUF32ozP2T6/oBQuHXU9fk+8RQyaUewsc6a8RoxqE3QpHhNSfm8
 mkqhB4uf+uxb7h156qHKrw+O77+FPZS75eIBXqDvnvjtwrMB+ejVsvVO1JGrRUkap570zJX
 YQfVccfd+SLMs5MFKV6pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QYTy0z+JYvM=:BnN4HfEsEybItVrKYvv/sj
 FvANxBXjzi1stt549giywAIO/EGUKxLMTfttfpd3ASiVjUvhVatsLoFkpqhNyQUJ/Vg38DT1A
 Tis1JQ7gDZGnaw1k0p1ioU1pdPdH7OgJnyrMWjWvV1/NmYlmVzWuMZj0t1wU5GFU4MNTSAnP8
 u8oD15wwvw+vWr6lATzdKrCihKk1VlPexUxEZ9sYZhdNaF8sbCPPLsfzDpvmADe7k91iuwgG/
 nNlUv3BGHc+ri+uR9xgZJtZ+GleH8QJrhHN8XPJxy4Tw9dACRBX74OdRtpwenlDkd8G765wCn
 gv4jri6CHDf9+L60xfmfd6V+ug1SSJJDQt3EQFS3qtTraNkV9irJ/jiieCVASEbH1F87HFK+W
 5gk8xYKjFCQh57LeGromQ5Uuvs6H17Ykdg0urM4O3mrj5IGPF/Qpbbmf/87iYXnTCfX5REQKv
 acSyiWOndT3qysK+z+QZjuZEw+kV7gaPjuRTGeHxg/+064DMzWgPrtVfC8/D8pYqzpV+Frhq7
 yt2DEVXZVWTqaiuJV+zZ3aq3hT6ryqT+uGuOBNJJrKkoMt6s+ypuQlH7gQvsjRYPCpT3N56Q0
 PJ8Yh8wnAOWJiHcVOOaXLx6r5uqKB3elNGxRUeh1vxjmC+RKDemVT9L3EiJKu+HZl7XmxW+rS
 lO6YT1HDhkIzZ96yvAlvv9lGm8LzIg+bpl/xPwUWTVZft42MAAIj9dznnpj9aVc95T0E5v51D
 GqY6qiXNYzL2rEtn1fDZPeObF8hM+3yf5jB78hETv2Maou/JOVfnf1PtnyoUGTpDAxaXOjvQn
 pY/PYvFYEK/1WAeZxDcyWNbnU9sImk5Yhg1AMIBaomoM9qRcv4ITQSVI27oVL1kfTFDUYT+0c
 APJEgkJJPHXz1BT7/nuOMpuFa/RmMCdcipXeM3fi3dXTPATD8dbou9nt6+f+81rK/SQdhK64m
 VGN4J4QZFgaanDfdosOtf1ZtHmWeRKx4QibnJbqWKyQpBvhHnRS/GCrV/A5DAnD2EYvxu8Ts5
 Nj29bvmrt01G5LkLcABR2wGxC9YZJVLdMiVnyjF9uPAB5Mh7ZPk84GsiJ/O4dR3zMZxJFa2FW
 FEaPtwFIVcxDyha4wsufCwiWKJFGXTm2o9e
Cc: Yi Wang <wang.yi59@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Sangbeom Kim <sbkim73@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Cheng Shengyu <cheng.shengyu@zte.com.cn>
Subject: Re: [alsa-devel] [PATCH 0/2] ASoC: samsung: odroid: fix err
 handling of odroid_audio_probe
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

V291bGQgYSBzdWJqZWN0IGxpa2Ug4oCcQVNvQzogc2Ftc3VuZzogb2Ryb2lkOiBGaXggaGFuZGxp
bmcgb2YgZGV2aWNlIG5vZGUgcmVmZXJlbmNlcwppbiBvZHJvaWRfYXVkaW9fcHJvYmXigJ0gYmUg
bW9yZSBhcHByb3ByaWF0ZSAoaW5zdGVhZCBvZiB1c2luZyB0aGUgYWJicmV2aWF0aW9uIOKAnGVy
cuKAnSk/CgoKPiBXZSBkZXZlbG9wZWQgYSBjb2NjaW5lbGxlIFNtUEwgdG8gZGV0ZWN0IOKApgoK
KiBJIHdvdWxkIGZpbmQgYSBzbGlnaHRseSBkaWZmZXJlbnQgd29yZGluZyBiZXR0ZXIuCgoqIEhv
dyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gY29udmVydCB0aGlzIGluZm9ybWF0aW9uIGludG8gc29m
dHdhcmUgYXR0cmlidXRpb25zCiAgZm9yIHRoZSB1cGRhdGUgc3RlcHM/CgpSZWdhcmRzLApNYXJr
dXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
