Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E101243414
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 08:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F056D1668;
	Thu, 13 Aug 2020 08:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F056D1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597300891;
	bh=bfHshUNCzuQPdc8sXb9aT6bDK74ARkzV3neqLDabwS4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrZBKDwoUzNCtzNcCmonG+BBAxKSxjiGQgSxSHNqL5Jn3Cr2qfeqI3FN0zIBsZ/IC
	 tz8Ej3doezCLVaVVAykV0vLSqnofnXNKjMLeowyTXmUI1GUEX+g97aelX+zR0Bb301
	 clvQgjuK5nNGg5oVLMoDLPle4XYGyYhj3fVD0a5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35173F800F4;
	Thu, 13 Aug 2020 08:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3DB5F8015B; Thu, 13 Aug 2020 08:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id 69475F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 08:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69475F800F4
Received: by ajax-webmail-mail-app2 (Coremail) ; Thu, 13 Aug 2020 14:39:19
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Thu, 13 Aug 2020 14:39:19 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Takashi Iwai" <tiwai@suse.de>
Subject: Re: Re: [PATCH] ALSA: pci/asihpi: Fix memory leak in
 snd_card_asihpi_capture_open()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <s5h5z9r6l8e.wl-tiwai@suse.de>
References: <20200810063957.13692-1-dinghao.liu@zju.edu.cn>
 <s5h5z9r6l8e.wl-tiwai@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <77ed04d7.569ba.173e68b5d88.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgBnEJ4X4DRfsRnOAQ--.39889W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgMKBlZdtPhtIQADsF
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUblIS07vEb7Iv0x
 C_JF4lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
 Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
 82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
 v26r1j6r18MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
 JwCS07vE7I0Y64k_MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2xY6xAIw28IcVCjz48v1sIEY2
 0_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCaFVCjc4AY6r1j6r4UMIAIbVC2
 0s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67AKxVWUGVWUWwCS07vEx4CE17
 CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCS07vEIxAIcVC0
 I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3w
 CS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUU==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kjlu@umn.edu,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Eliot Blennerhassett <eblennerhassett@audioscience.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiBPbiBNb24sIDEwIEF1ZyAyMDIwIDA4OjM5OjU1ICswMjAwLAo+IERpbmdoYW8gTGl1IHdyb3Rl
Ogo+ID4gCj4gPiBXaGVuIHNuZF9wY21faHdfY29uc3RyYWludF9wb3cyKCkgZmFpbHMsIGRwY20g
c2hvdWxkIGJlIGZyZWVkCj4gPiBqdXN0IGxpa2Ugd2hlbiBocGlfaW5zdHJlYW1fb3BlbigpICBm
YWlscy4KPiAKPiBJdCB3aWxsIGJlIGNsZWFuZWQgdXAgdmlhIHJ1bnRpbWUtPnByaXZhdGVfZnJl
ZSBjYWxsIGluIHRoZSBjYWxsZXIKPiBzaWRlIChzbmRfcGNtX29wZW4gLT4gc25kX3BjbV9yZWxl
YXNlX3N1YnN0cmVhbSAtPgo+IHNuZF9wY21fZGV0YWNoX3N1YnN0cmVhbSksIGhlbmNlIHRoaXMg
d291bGQgcmVzdWx0IGluIGRvdWJsZS1mcmVlLgo+IAoKSXQncyBjbGVhciB0byBtZSwgdGhhbmtz
IQoKUmVnYXJkcywKRGluZ2hhbw==
