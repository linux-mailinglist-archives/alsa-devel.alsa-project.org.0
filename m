Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069A5665B7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 11:00:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9848A16C3;
	Tue,  5 Jul 2022 10:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9848A16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657011619;
	bh=SRW0tQcSoOXK/hAJ3I3SM333+ERcODiRofpC7JgNC3o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZt5AQcmz1DGPS8AmkdoEgBJE7hPc7QroR4LWkjeU+xgCdQnfHakubgHiN6pyXjDX
	 fZaLyo2iHi7QNvDgVta6Y9Jr19XG8NwPKGO3jwDtvSbiNh4GaHfrtBOpzj2k1VHdSA
	 GrlsT3V+qLBSswPav1nnoWmTimRs9FoDWC8qjKEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31766F80212;
	Tue,  5 Jul 2022 10:59:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA73F8014E; Mon,  4 Jul 2022 14:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
 by alsa1.perex.cz (Postfix) with ESMTP id C4F79F8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 14:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F79F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=126.com header.i=@126.com header.b="pvxJTUsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=2S/0Q
 Ne/5GZDlUqH1ejYnly5iwK6FxvYYDJxMc9C7SY=; b=pvxJTUsaCnBpsLIKhSB/n
 pc95Gmss5qXw3TsYvEKVNDY33T3uSRwpELFTaJXZalqiRQuKN0rLRawgPsR6t/Uy
 CRwPSln2hJ5OGTdmsW3lyATiJSrOBi9R8IDTSKtdlllkkQL3I8VlP51JUNb7uQxt
 wgpPwqinqwow6D7i7gj6m8=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Mon, 4 Jul 2022 20:22:46 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Mon, 4 Jul 2022 20:22:46 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Mark Brown" <broonie@kernel.org>
Subject: Re:Re: [PATCH] sound: qcom: Fix missing of_node_put() in
 asoc_qcom_lpass_cpu_platform_probe()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YsLNPbY1snYon8xL@sirena.org.uk>
References: <20220702020109.263980-1-windhl@126.com>
 <YsLNPbY1snYon8xL@sirena.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <107379b3.7d54.181c929c397.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowACntnKX28JiTTNFAA--.48372W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hA0F1uwMVtShQABs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Tue, 05 Jul 2022 10:59:17 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, linmq006@gmail.com
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

CgoKQXQgMjAyMi0wNy0wNCAxOToyMTozMywgIk1hcmsgQnJvd24iIDxicm9vbmllQGtlcm5lbC5v
cmc+IHdyb3RlOgo+T24gU2F0LCBKdWwgMDIsIDIwMjIgYXQgMTA6MDE6MDlBTSArMDgwMCwgTGlh
bmcgSGUgd3JvdGU6Cj4+IFdlIHNob3VsZCBjYWxsIG9mX25vZGVfcHV0KCkgZm9yIHRoZSByZWZl
cmVuY2UgJ2RzcF9vZl9ub2RlJyByZXR1cm5lZCBieQo+PiBvZl9wYXJzZV9waGFuZGxlKCkgd2hp
Y2ggd2lsbCBpbmNyZWFzZSB0aGUgcmVmY291bnQuCj4KPlBsZWFzZSBzdWJtaXQgcGF0Y2hlcyB1
c2luZyBzdWJqZWN0IGxpbmVzIHJlZmxlY3RpbmcgdGhlIHN0eWxlIGZvciB0aGUKPnN1YnN5c3Rl
bSwgdGhpcyBtYWtlcyBpdCBlYXNpZXIgZm9yIHBlb3BsZSB0byBpZGVudGlmeSByZWxldmFudCBw
YXRjaGVzLgo+TG9vayBhdCB3aGF0IGV4aXN0aW5nIGNvbW1pdHMgaW4gdGhlIGFyZWEgeW91J3Jl
IGNoYW5naW5nIGFyZSBkb2luZyBhbmQKPm1ha2Ugc3VyZSB5b3VyIHN1YmplY3QgbGluZXMgdmlz
dWFsbHkgcmVzZW1ibGUgd2hhdCB0aGV5J3JlIGRvaW5nLgo+VGhlcmUncyBubyBuZWVkIHRvIHJl
c3VibWl0IHRvIGZpeCB0aGlzIGFsb25lLgoKVGhhbmtzIGZvciB5b3VyIGFkdmljZSwgSSB3aWxs
IGZvbGxvdyB0aGlzIHJ1bGUgaW4gZnV0dXJlIHBhdGNoIHdvcmsuCgpMaWFuZyAK
