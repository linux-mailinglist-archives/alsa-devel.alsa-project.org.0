Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBECE2A7FB0
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 14:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702C3166F;
	Thu,  5 Nov 2020 14:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702C3166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604582945;
	bh=pcnmHbDQu8GbyyLey8ydD5w9czPlndqFD5Nfo7Y2uWo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5GPAXNdSmsNIbNZ4Po4AoWw/kq0lL70p3sW61M+Eyfs/ABpaWoP63lDCGnL84VUJ
	 5M5ZyYpZuuZpubLkTOtTk96DW4KjlM3kCtzdAt3diAp7CrjukeRL7+s+ACJSXfAMmq
	 ndoRQNSRbY99kf7APGWvVLvgAttrIxJ25bwXA640=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D246AF80245;
	Thu,  5 Nov 2020 14:27:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1F68F80171; Thu,  5 Nov 2020 14:27:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id F0808F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 14:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0808F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="BJFp4CeD"
X-UUID: cdcd7782eb3b4e35bb1070ae7237c5ae-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pcnmHbDQu8GbyyLey8ydD5w9czPlndqFD5Nfo7Y2uWo=; 
 b=BJFp4CeDNTLhAImvpbmcRUVrD6suw/DRxo18fc5U14f0HQ3Lm4tV39SJ6WeVncZy9DiWZkKYV9W2AfxAleCdLKfdb0UsAJVuFSScFI5zb/txwWh5JEeXDzNbXBhTSsGGcWsBqHI0CD2Agx8YkEliS9WypTXl/g/kTFrDvbLs2eQ=;
X-UUID: cdcd7782eb3b4e35bb1070ae7237c5ae-20201105
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 974526844; Thu, 05 Nov 2020 21:27:11 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 5 Nov 2020 21:27:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 5 Nov 2020 21:27:09 +0800
Message-ID: <1604582829.26523.17.camel@mhfsdcap03>
Subject: Re: [PATCH -next v2] ASoC: mediatek: mt8192: Make some symbols static
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Zou Wei <zou_wei@huawei.com>
Date: Thu, 5 Nov 2020 21:27:09 +0800
In-Reply-To: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
References: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4E3BCA4F16C884482DEDA47F609076C23E9CAA032D1A648EB2745A62481CDE4C2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

T24gVGh1LCAyMDIwLTExLTA1IGF0IDIwOjI4ICswODAwLCBab3UgV2VpIHdyb3RlOg0KPiBGaXgg
dGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZ3M6DQo+IA0KPiAuL210ODE5Mi1kYWktaTJzLmM6
MjA0MDo1OiB3YXJuaW5nOiBzeW1ib2wgJ210ODE5Ml9kYWlfaTJzX2dldF9zaGFyZScgd2FzIG5v
dCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4gLi9tdDgxOTItZGFpLWkycy5jOjIw
NjA6NTogd2FybmluZzogc3ltYm9sICdtdDgxOTJfZGFpX2kyc19zZXRfcHJpdicgd2FzIG5vdCBk
ZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4gLi9tdDgxOTItYWZlLWdwaW8uYzoxNTox
Njogd2FybmluZzogc3ltYm9sICdhdWRfcGluY3RybCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxk
IGl0IGJlIHN0YXRpYz8NCj4gLi9tdDgxOTItYWZlLXBjbS5jOjcwOjU6IHdhcm5pbmc6IHN5bWJv
bCAnbXQ4MTkyX2dldF9tZW1pZl9wYnVmX3NpemUnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBp
dCBiZSBzdGF0aWM/DQo+IC4vbXQ4MTkyLWFmZS1wY20uYzoyMTM3OjM5OiB3YXJuaW5nOiBzeW1i
b2wgJ210ODE5Ml9hZmVfY29tcG9uZW50JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUg
c3RhdGljPw0KPiANCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+DQoNCkFja2Vk
LWJ5OiBKaWF4aW4gWXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQpUaGFua3MgZm9yIHRoZSBm
aXhpbmcuDQo=

