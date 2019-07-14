Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991967E55
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jul 2019 10:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02191669;
	Sun, 14 Jul 2019 10:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02191669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563094200;
	bh=J3fw3pQTJiTnRer8D8AzRBVbqi2IF81XkhdkxBm1hJQ=;
	h=References:To:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecNJyRoC+1sIKMiqLqh2AH9Bd8fwJASPmpmuJdQ6/oGUURlgAboM1jfxWtWC1zq6L
	 6sZs8lZXwi9kv6BcbEisMzS8RBJ7eEUKL/eBws5Rbl5ed4Tj3KYvt1iJ+hU0RN+gUW
	 pSF8ApOmJ7R4HTk/iu5GYhenguMKZvPXuBH3KhCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFAFF80377;
	Sun, 14 Jul 2019 10:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18238F80377; Sun, 14 Jul 2019 10:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D763F802BC
 for <alsa-devel@alsa-project.org>; Sun, 14 Jul 2019 10:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D763F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="MczfnUsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1563094054;
 bh=u0+UBJAk63DP/if+SWGzS+4Hh1T7CazhhWMvMVpjpAE=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=MczfnUsYW/An7EBRsVVkuiY01ar6Wjsd4/vcad4+hTHcejANyxQ4+s9PSbDudHjdi
 sHgQD5KmILwwf8Ks7fNNJqv7H9j2v3ruSp/mE0IboCZxtt7cilPQv2zpC3G54VShjj
 kKT4GiqBPIAUMMJ4tPBWr1IJ3rVldDfRQvQLA3ks=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.159.144]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSads-1hwNH73X88-00RYOp; Sun, 14
 Jul 2019 10:47:34 +0200
References: <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
To: Wen Yang <wen.yang99@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>,
 alsa-devel@alsa-project.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0eeabac6-edbd-b829-817f-ffff87e1a825@web.de>
Date: Sun, 14 Jul 2019 10:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-US
X-Provags-ID: V03:K1:rxYjDolk16ptYg3SOXZ3jY13J6Cf6owqsYMky4Hw2TBKVxwew74
 d90w/+kqJI/cFdZmiVjPBZ1ZPPMMqtHBhHKiDMtYUhng5zC56NNe6GrlsNJ2+/YX01lh0Q9
 c9QEKtU6bJoKIA0FVRvvdPT0t/lN3cGlx6FJaAsmVQ4wye4FfSIvR+iyLQwCH3tueU0FN1O
 tSyjnkdkisYc4jLDIH7Tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sd5OJjYO3hA=:c0VZ102RvND10XMvOO62Xn
 uvuZkxHfmJhE9cVSNwFgAYapGBEI1zkr6goILjptNHhe2njBlQL7WLuHE7dyxSsFY+/XQ2LGO
 IYNIfMAKmww0Ug4HmonXBBnAvGYRkeHyiPb2lTLOaqjXTmJF/lYDNtiTK5SrW+wVh0piB3CHh
 aJ+nINYqcmYpyeO+r2YDRDIGRz1yBWgsiL3L8rtg4aAlQ292KlTdv/bK/01DR42rlheeMkeld
 LCWTDZwAB6sBKD8PSA7GT1pM6Wc5jN0DIU6GRETu1SiilHpxPYI6XzeeZjsXw1Gp93CeF+gzr
 rA3SLkwtXc8R/q7Ud+v4ux4RxwmvchVt024V8pnFa7v7ig8pEhNbKZXdwTvDT/fraxUGbHcOM
 U+xDAc6GBcAq3G5oKEaG2wwmYG9BeXdMxHWGCLSeUR0S37+hQMBObF76V1oItzyBgsCziJml8
 2hkcmqkSvhQJfnH4BvgIWzanaLOr6HnTkTghufH432fhK6hYRUsNZls4ATF8kazbgWXMqCWa7
 +/4bdCDKrn5UvjUxfwHxYheqzPN8RbivRYO+A53VI9bY9XDjROSd61Esi5d0uOKI0jfe/WXNm
 /rAYrgaV5rZzUs6N+oDzCszPu0358bifvtptZ5b6XSKk3/pAozI2ir3zkMq9QUsZ1NN2k1qoB
 DRDOWatRYOI49zGPJFiDB7NHKVom5HMvLg/Y0464ZAijGGTtL+sJCtumCgrmCeWb5z2g7ifzm
 T2UFWPPE2q8wN8NfpLkc75ZT/HQKFJP9IGUzb1qu/lmvqoJwhApPiMtxu3NTDZqUG/VRiLATp
 OmC8so4Yo3qCvWvZsA6RGtTyW3YTBU3D5zpjGa2PK72UoFlJgPK5I+0Q3S4mkDsrnLSyBpi1p
 iMUAzmSivmvjkuwQ+gEWZqw6RzrsBc5eLikjr++hlD6QznAAMN6zlOV2JLUEqEbCDykqDtc5K
 d+Kboc7VUEoiqsVnqJoTJNKy+/KzeP7CImAVMDmmIqbqokgxOWvN7Taw2fGTgr+LApEfX1wBR
 EXgDg9ruMZd37xkzEzi3sdjegGCfvJStaafKGkD9yaohHmFsX1ZkgAIR+vTfb8HMxW939KiwR
 ql+xdq6gIcht4orzU9gqlGqB1p2TNfQaw8e
Cc: Yi Wang <wang.yi59@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Sangbeom Kim <sbkim73@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Cheng Shengyu <cheng.shengyu@zte.com.cn>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: odroid: fix an
 use-after-free issue for codec
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

PiBAQCAtMzE3LDYgKzMxNiw3IEBAIHN0YXRpYyBpbnQgb2Ryb2lkX2F1ZGlvX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCgo+ICAJCWdvdG8gZXJyX3B1dF9jbGtfaTJzOwoKPiAg
CX0KCj4KCj4gKwlvZl9ub2RlX3B1dChjb2RlYyk7CgoKSSB3b3VsZCBwcmVmZXIgdG8gYXZvaWQg
YSBiaXQgb2YgZHVwbGljYXRlIHNvdXJjZSBjb2RlIGFsc28gYXQgdGhpcyBwbGFjZS4KVGh1cyBJ
IHdvdWxkIGZpbmQgYSBzdGF0ZW1lbnQgbGlrZSDigJxnb3RvIHB1dF9ub2RlO+KAnSBtb3JlIGFw
cHJvcHJpYXRlIGhlcmUuCgoKPiAgCXJldHVybiAwOwoKPgoKPiAgZXJyX3B1dF9jbGtfaTJzOgoK
CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
