Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFF683A4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 08:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAA951669;
	Mon, 15 Jul 2019 08:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAA951669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563172971;
	bh=auGKOLM6vRijklMQjRTQLdAMTd2hWE3stRJDCu/TLzc=;
	h=References:From:To:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rxu01kSfQAp4o2g2FgV8YcT/8VK7Dr8R3ZkD+cu8aDnt6EvRZ6z8hq1ARpxn3NqLX
	 MMKbj1OGij4ssBZYmKUj1wI8WOvEQw/yWzhijxKIALWvBzRjpL/z31P7z+d3rczzzK
	 l9O0WXjfK7arTBZfn52xQDiFOXv666qipy1RT5eQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C42F800C6;
	Mon, 15 Jul 2019 08:41:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08633F80367; Mon, 15 Jul 2019 08:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_21,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ADBDF800D8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 08:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ADBDF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="Ncd0SFc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1563172835;
 bh=5N7eSzP8Tge+KuNT1ByNfjpaRy8jABPbJMW1CVN3BO8=;
 h=X-UI-Sender-Class:Subject:Cc:References:From:To:Date:In-Reply-To;
 b=Ncd0SFc0uWIbKgSGcepmFx9gSLxV67/NWF8o6nXu8OOftEE6HgOWmfxLiW74gdcwF
 Daxk31Leg38oDqDMH9nEhbhxcVfWa9Y/GoGdRElFGcjYRRq7cCftMOGnFPSZxUyKiG
 wP5DCdNgyC5ePRJRzGob0ssqFW4pcsUCqr0T6FoI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.73.93]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LxweO-1iYQbf1L2i-015GKT; Mon, 15
 Jul 2019 08:40:35 +0200
References: <201907150949139435825@zte.com.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Wen Yang <wen.yang99@zte.com.cn>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
Message-ID: <23d82d8b-d600-b28f-9444-65afe04a781a@web.de>
Date: Mon, 15 Jul 2019 08:40:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201907150949139435825@zte.com.cn>
Content-Language: en-US
X-Provags-ID: V03:K1:kdpL+1mGs2vHWKv1DMqvrBT4iGiLJvJV0KoE2AFL1EQCrSCthr7
 rP3myNrH+dj+I8cRJzcPIRLqHH8t51HF+9ygtIa4JrmNqxjILFHaDKCo+ahs5UlTTbucmMN
 leZovJkMtme1ZIP8GXDc1TsUCHm4xqMQkp3K3ztGxpKCbwyBTXlIm7y+7cCRbXq5K+QIBY3
 I3cKROv4WSV7c895ZLlFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hbv3PXxoCN0=:Zez5eONvyPtHFryPLpU1vt
 lG370vbqGn7UYA3mLpiiPVthFRZuvVeyEbmNwJAKzJ+nq5jV+JTrvC56jYEnds5TXGZr2bnDr
 RrmrpoMT9s0Kom041c2rBrKW3viXTfPeIu7NTZ0W9wwaMmm0XnWwW4sGSL5GS91dC07p3+fqb
 Ur+DvP2FEwkHAMuk8AO71nE2oQz5SAJzgJkIf/WIPuBrE8iEvir2fPP0EEgezSf+ACg7IfkVI
 BrdNZP7o0V4WY6JB8NHU4UzH10j2bvf6pp3X63WdsSXh/28MbF8kaxBWZfmPZbLbHGoybOOqu
 SU7uy/Zl2QrX0c8+t12CEDuo/lL/2cKsSoPVwPErKm5+Y90xRFH1N8JrfbV+EZbLU9k8W0PnY
 zcHyOdl2fjZloJI3Uv05xQXcZR9kSWuHIwWpiaxTgXSLySxMzV+qR4YPbHkvaMJlhO2JZNpH5
 n0LP/Kw4u0KYxMzTY7TqYuJrSSF5/1tgEeELfkGpwiZ6a73r9+TJVm6n8v97niuI0DDpL1i6D
 aw5W/TKXD13qVDyIOfqoJmuhHy0TarLUp1FVg7cGqlCj2wbCm+4s3bWKa1JUzJnTBrOrJL7tL
 0JowQF3itcCUDEdcNnUy8aa/A02yk2pFUYa8Jw0pgirjR9I5einV5UWo3jhqb+2fTjBZXhgKz
 je3fmITlZxGbUlFwgn0oCatROXssUn1VgS74HGasoShBMOBjulLQLgBjufsdpXb3RztbSP6VU
 72b7vzTRIeYgUmAeQD80RhScu93gxe5vYpMtKQSftTzCezjQYb7rA/rrDENSWYdUJ2T3uajJ4
 VGGp/e+lu2vvdOI5WHD1vNUYbwBSNE//8B1NFRmY71wJY1JLxGDI4wOyJx9Le34/3cIWmTQ46
 E29J9KaIBbeuPE6UD/nXi2WfGfb6paqIfEBi1I6U93Uh1N2TwZG3mbVscIqH+lGv4LS6xR4kX
 Z4Fx6t+FYpIAuc5sQ706wICVn2CyloZK3FFvq59/xcY7xyImiE+d5eKrcVI+xf3jqxlX4LbQ3
 B1CCQgsbT9Dzo8YUaNEF74eBx41dHGDeJEcH0owMaGDM5BOJYycEMTSGEN8ogMsjw6UhbvQyP
 SojfNPJ7glue5ScFlkeOEOIIVLWICJOVgUL
Cc: Yi Wang <wang.yi59@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiBUaGVzZSB0d28gdXBkYXRlcyBmaXggdHdvIGRpZmZlcmVudCBidWdzLgoKSSBjYW4gZm9sbG93
IHRoaXMgdmlldyB0byBzb21lIGRlZ3JlZS4KCgo+IGFuZCB0aGUgb3RoZXIgaXMgdGhlIGRvdWJs
ZS1mcmVlIGlzc3VlCgpUaGlzIHByb2dyYW1taW5nIGVycm9yIGFmZmVjdHMgYWxzbyB0aGUgdXNl
IG9mIGRhdGEgc3RydWN0dXJlcyB3aGljaCBiZWNhbWUgaW52YWxpZC4KaHR0cHM6Ly9jd2UubWl0
cmUub3JnL2RhdGEvZGVmaW5pdGlvbnMvNDE1Lmh0bWwjb2NfNDE1X05vdGVzCgoKPiBTbyB3ZSBz
ZW50IHR3byBwYXRjaGVzIHRvIGZpeCB0aGVtIHNlcGFyYXRlbHkuCgpZb3Ugd291bGQgbGlrZSB0
byBmaXggc29tZXRoaW5nIGFjY29yZGluZyB0byB0d28gdmFyaWFibGVzIChvZiB0aGUgZGF0YSB0
eXBlIOKAnGRldmljZV9ub2RlICrigJ0pCmluIHRoZSBzYW1lIGZ1bmN0aW9uIGltcGxlbWVudGF0
aW9uLgpQbGVhc2UgY29tYmluZSB0aGVzZSBjb3JyZWN0aW9ucyBpbiBhbiB1cGRhdGUgc3RlcCB1
bmRlciBhIHRvcGljIGxpa2UK4oCcQVNvQzogc2Ftc3VuZzogb2Ryb2lkOiBGaXggaGFuZGxpbmcg
b2YgZGV2aWNlIG5vZGUgcmVmZXJlbmNlcyBpbiBvZHJvaWRfYXVkaW9fcHJvYmUoKeKAnS4KKFRo
ZSBwcmV2aW91cyB1cGRhdGUgc3RlcCB3b3VsZCBjb250YWluIHN0aWxsIGEga25vd24gcHJvZ3Jh
bW1pbmcgbWlzdGFrZSBvdGhlcndpc2UsCndvdWxkbid0IGl0PykKClJlZ2FyZHMsCk1hcmt1cwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
