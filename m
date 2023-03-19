Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D226C2178
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D760843;
	Mon, 20 Mar 2023 20:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D760843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340711;
	bh=rDWr1Yl22EBYRvPGKycAtLqQo3fYEeuCOlP/FzgIjGA=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E4z4rvWLibESXLNQO55ZV2GvG19a2xb/Jh4SxwDS/92eW9TxEaPnMSdq/Jtge+wpr
	 09ChDFlRbCJpCV1dHPRV4gJxeBeLhB7lbFzKBv0NXGDuAJ4e6P65/5vIDQXbdfILFH
	 ESSMT8Tk3brYLIaPuT/g5r44K5m7s2ELodlCQ8Sk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 508E2F80105;
	Mon, 20 Mar 2023 20:30:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1437F8027B; Sun, 19 Mar 2023 11:48:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m13109.mail.163.com (m13109.mail.163.com [220.181.13.109])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD17F80093
	for <alsa-devel@alsa-project.org>; Sun, 19 Mar 2023 11:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD17F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=HTDUj+SY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=IF12IRRgfjUxeap6MayO9VKB4+speWM16N+dR3azznI=; b=H
	TDUj+SYmiefZIroHcxvLAxnvmUzBG1aV55q78U75jgAvl3z1mufk/OfsFWljYeeS
	zMcatrcGffCNtt0R0+KgJ5GnG9cdWxJ3VgTZMNnt2J3KrbTxWFlGSG5ZTMc/22Lw
	2w9AlSwh0UCeYKfZeG+tn7habUKKILLsKPrUZba4G0=
Received: from sensor1010$163.com ( [120.245.132.192] ) by
 ajax-webmail-wmsvr109 (Coremail) ; Sun, 19 Mar 2023 18:47:51 +0800 (CST)
X-Originating-IP: [120.245.132.192]
Date: Sun, 19 Mar 2023 18:47:51 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Takashi Iwai" <tiwai@suse.de>
Subject: Re:Re: [PATCH v1] ALSA:ac97: Remove redundant driver match function
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <87h6uhma0g.wl-tiwai@suse.de>
References: <20230319044733.327091-1-sensor1010@163.com>
 <87h6uhma0g.wl-tiwai@suse.de>
X-NTES-SC: 
 AL_QuycC/6ZvUAs5yefbOkXn0kShuc8WcC4v/Qv345RP5k0oyvu2gQsY1lmBGPMysmCMRCplj6TYBNFzs9xRoJgWoBCiammqzHNsg/ekpktLwJH
MIME-Version: 1.0
Message-ID: <77006340.15c8.186f97b96e7.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bcGowACXn2dX6BZkcXgbAA--.38672W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBXgw3q1aEA9tFvwABs-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-MailFrom: sensor1010@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CIOGARMABCSOEAMZ373Q3VFMDY44KZW4
X-Message-ID-Hash: CIOGARMABCSOEAMZ373Q3VFMDY44KZW4
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:30:06 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIOGARMABCSOEAMZ373Q3VFMDY44KZW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CgoKSEkgOiAKICAgICBteSBuYW1lIGlzIGxpIFpoZSwgSSBhbSBDaGluZXNlCgoKCgoKCgoKCgoK
CgoKQXQgMjAyMy0wMy0xOSAxNjoxNjoxNSwgIlRha2FzaGkgSXdhaSIgPHRpd2FpQHN1c2UuZGU+
IHdyb3RlOgo+T24gU3VuLCAxOSBNYXIgMjAyMyAwNTo0NzozMyArMDEwMCwKPkxpemhlIHdyb3Rl
Ogo+PiAKPj4gSWYgdGhlcmUgaXMgbm8gZHJpdmVyIG1hdGNoIGZ1bmN0aW9uLCB0aGUgZHJpdmVy
IGNvcmUgYXNzdW1lcyB0aGF0IGVhY2gKPj4gY2FuZGlkYXRlIHBhaXIgKGRyaXZlciwgZGV2aWNl
KSBtYXRjaGVzLCBzZWUgZHJpdmVyX21hdGNoX2RldmljZSgpCj4+IAo+PiBEcm9wIHRoZSBidXMn
cyBtYXRjaCBmdW5jdGlvbiB0aGF0IGFsd2F5cyByZXR1cm5lZCAxIGFuZCBzbwo+PiBpbXBsZW1l
bnRzIHRoZSBzYW1lIGJlaGF2aW91ciBhcyB3aGVuIHRoZXJlIGlzIG5vIG1hdGNoIGZ1bmN0aW9u
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTGl6aGUgPHNlbnNvcjEwMTBAMTYzLmNvbT4KPgo+SXMg
TGl6ZWggeW91ciByZWFsIGZ1bGwgbmFtZT8gIChpLmUuIHlvdXIgbmFtZSBpcyAiTGkgWmhlIiA/
KQo+SSdtIGFza2luZyBiZWNhdXNlIHRoZSBTaWduZWQtb2ZmLWJ5IGxpbmUgaXMgYSBsZWdhbCBy
ZXF1aXJlbWVudC4KPgo+Cj50aGFua3MsCj4KPlRha2FzaGkK
