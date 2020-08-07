Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6F23EAF8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 11:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E49431612;
	Fri,  7 Aug 2020 11:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E49431612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596793936;
	bh=VWcSr1DpWpf5tMFOTXCPQGxJ51EnKrxLyvkNXrGvqkw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwhHgFwcAmqs3Rt5eF4WYPqafiUsy5R6tu8lZMcAVHcJV0F8jZzvXBFWoeObKTr6T
	 6tWgg+iKON4p70gXCypchU0hmKD4kfq0fKWNHxgXcfLoXwQ1F6hmrYfGnmI42DWLSn
	 P33ZamBx5yXX6x2jHaT1OPufqmtBJKN6/q/9YdUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F99F80234;
	Fri,  7 Aug 2020 11:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9260DF80218; Fri,  7 Aug 2020 11:50:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id D254AF800B7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 11:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D254AF800B7
Received: by ajax-webmail-mail-app3 (Coremail) ; Fri, 7 Aug 2020 17:50:13
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.186]
Date: Fri, 7 Aug 2020 17:50:13 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Takashi Iwai" <tiwai@suse.de>
Subject: Re: Re: [PATCH] ALSA: usb-audio: Fix memleak in scarlett2_add_new_ctl
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <s5htuxeanl2.wl-tiwai@suse.de>
References: <20200807071229.9533-1-dinghao.liu@zju.edu.cn>
 <s5htuxeanl2.wl-tiwai@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2632689f.4acd5.173c853f824.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgAH0t7VIy1fY10wAg--.31871W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgECBlZdtPbBHgAHsW
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXIS07vEb7Iv0x
 C_JF4lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVW8uwCS07vEc2IjII80xcxEwVAKI48JMI
 AIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_JF0_Jw1lV2xY6IIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04
 k26cxKx2IYs7xG6rW3Jr0E3s1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY
 6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
Cc: alsa-devel@alsa-project.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "Geoffrey D. Bennett" <g@b4.vu>
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

CgomcXVvdDtUYWthc2hpIEl3YWkmcXVvdDsgJmx0O3Rpd2FpQHN1c2UuZGUmZ3Q75YaZ6YGT77ya
Cj4gT24gRnJpLCAwNyBBdWcgMjAyMCAwOToxMjoyNyArMDIwMCwKPiBEaW5naGFvIExpdSB3cm90
ZToKPiA+IAo+ID4gV2hlbiBzbmRfdXNiX21peGVyX2FkZF9jb250cm9sKCkgZmFpbHMsIGVsZW0g
bmVlZHMgdG8gYmUKPiA+IGZyZWVkIGp1c3QgbGlrZSB3aGVuIHNuZF9jdGxfbmV3MSgpIGZhaWxz
LiBIb3dldmVyLCBjdXJyZW50Cj4gPiBjb2RlIGlzIHJldHVybmluZyBkaXJlY3RseSBhbmQgZW5k
cyB1cCBsZWFraW5nIG1lbW9yeS4KPiAKPiBObywgdGhpcyB3b3VsZCBsZWFkIHRvIGRvdWJsZS1m
cmVlLiAgc25kX2N0bF9hZGQoKSBzaG93cyBhIGtpbmQgb2YKPiBzcGVjaWFsIGJlaGF2aW9yLCBp
dCBhbHJlYWR5IHJlbGVhc2VzIHRoZSBvYmplY3QgYXQgaXRzIGVycm9yIHBhdGguCj4gCgpJdCdz
IGNsZWFyIHRvIG1lLCB0aGFua3MhCgpSZWdhcmRzLApEaW5naGFvCg==
