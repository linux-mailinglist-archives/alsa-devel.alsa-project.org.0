Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAC24A1B8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 16:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4A6185E;
	Wed, 19 Aug 2020 16:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4A6185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597847259;
	bh=YymJ3dZVzHVrgFLhK05T17oVu6zGDEJc8AVV1WphDOI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ur7Rayg1uTNnLl6I9YkKx3xCUfDVk8CPT4b3KPyNVp0VBin9FVnXCLkX+8F9ugp6S
	 7f8iv2F0NYBcF6xKSW1OXCx4Ez2kXbBiIUh4/FWjXJ6MZm4MO8t7lDQfRfEqmsBTuB
	 0mCpKN++BHE9QSoBxHRZNLAyuRvXEaZY+YhtQ4Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6678F800D3;
	Wed, 19 Aug 2020 16:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06D9CF80218; Wed, 19 Aug 2020 16:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBB32F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 16:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBB32F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="pzMxnP7G"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1597847150; x=1629383150;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YymJ3dZVzHVrgFLhK05T17oVu6zGDEJc8AVV1WphDOI=;
 b=pzMxnP7GrCh6W+ijxTSlAsf/0CRQAEl9Jkc/k9jhHHqhux5Hd81eZbVH
 hSl2ahvW92UQ/I6c0D7mIPZt97mfeZbbfw2duaaciXqExgCGTWI7prsw0
 gTuHlcgOgqnfB3VjYk6Tqtid/1ZItKhm1Ty94l2bDIzEVmwrIdK91nsXO
 ZRGPu6ydBqwinh2WN6LmUkskUUFn8OP1NnMLsp/cjuWRRy/03k3NMvnBV
 r5lez6MW4YhOArWytl5Ug3GqglOQw66fRlqMYth28lEhqM8zlrgVWP9S5
 AM06cyFMTgAG3sgNBBksUmJnINno/gEFpFo2nQdRB/6ZkP5AXkh0xFuhS w==;
IronPort-SDR: 5PZhNmYKfRS1iEeazk3AUKjiex7CCBzJyiV0oe9bAGIFuqLnuWxvzOP+yOxygw0LMhZigOUvVQ
 Oh1reciiML1xT1TScCcBSeclRPTNjstksGsl+TaIVoY/ATKey4/zPptkdOvg8NSe9HjE+Aplpq
 1MT9V3sFQa6u1SNwc/G8gdgsx7/Qzw7/ajztXCosU35zxddFuAW/MmfTcXf6NY1TTIij3D0ApU
 GG6BpbvaK3nicyTS5nXQ5X+jOD3Lsz2K8yCeR7dm7AQ8AZWUn6LW097UuGtm1cDm93J6JoWuLM
 gYk=
X-IronPort-AV: E=Sophos;i="5.76,331,1592863200"; 
   d="scan'208";a="2645167"
From: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Robin Gong <yibin.gong@nxp.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQZKYOChL0mPkuCFeZyDJy6mKk3KiiAgABS1/CAB7DUgIAAV/7Q
Date: Wed, 19 Aug 2020 14:25:43 +0000
Message-ID: <6b5799a567d14cfb9ce34d278a33017d@skidata.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
In-Reply-To: <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXJzLVBldGVyIENsYXVzZW4g
PGxhcnNAbWV0YWZvby5kZT4NCj4gU2VudDogTWl0dHdvY2gsIDE5LiBBdWd1c3QgMjAyMCAxMzow
OA0KPiBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgYW4gc2RtYSBzcGVjaWZpYyBwcm9ibGVtIGFmdGVy
IGFsbC4NCj4gZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYygpIHdpbGwgaXNzdWUgYSByZXF1ZXN0
IHRvIHN0b3AgdGhlIERNQS4gQnV0IGl0DQo+IGlzIHN0aWxsIHNhZmUgdG8gaXNzdWUgdGhlIG5l
eHQgdHJhbnNmZXIsIGV2ZW4gd2l0aG91dCBjYWxsaW5nDQo+IGRtYWVuZ2luZV9zeW5jaHJvbml6
ZSgpLiBUaGUgRE1BIHNob3VsZCBzdGFydCB0aGUgbmV3IHRyYW5zZmVyIGF0IGl0cw0KPiBlYXJs
aWVzdCBjb252ZW5pZW5jZSBpbiB0aGF0IGNhc2UuDQo+IA0KPiBkbWFlZ2luZV9zeW5jaHJvbml6
ZSgpIGlzIHNvIHRoYXQgdGhlIGNvbnN1bWVyIGhhcyBhIGd1YXJhbnRlZSB0aGF0IHRoZQ0KPiBE
TUEgaXMgZmluaXNoZWQgdXNpbmcgdGhlIHJlc291cmNlcyAoZS5nLiB0aGUgbWVtb3J5IGJ1ZmZl
cnMpIGFzc29jaWF0ZWQNCj4gd2l0aCB0aGUgRE1BIHRyYW5zZmVyIHNvIGl0IGNhbiBzYWZlbHkg
ZnJlZSB0aGVtLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9ucyENCg0KPiBJIGRv
bid0IGtub3cgaG93IGZlYXNpYmxlIHRoaXMgaXMgdG8gaW1wbGVtZW50IGluIHRoZSBTRE1BIGRt
YWVuZ2luZQ0KPiBkcml2ZXIuIEJ1dCBJIHRoaW5rIHdoYXQgaXMgc2hvdWxkIGRvIGlzIHRvIGhh
dmUgc29tZSBmbGFnIHRvIGluZGljYXRlDQo+IGlmIGEgdGVybWluYXRlIGlzIGluIHByb2dyZXNz
LiBJZiBhIG5ldyB0cmFuc2ZlciBpcyBpc3N1ZWQgd2hpbGUNCj4gdGVybWluYXRlIGlzIGluIHBy
b2dyZXNzIHRoZSB0cmFuc2ZlciBzaG91bGQgZ28gb24gYSBsaXN0LiBPbmNlDQo+IHRlcm1pbmF0
ZSBmaW5pc2hlcyBpdCBzaG91bGQgY2hlY2sgdGhlIGxpc3QgYW5kIHN0YXJ0IHRoZSB0cmFuc2Zl
ciBpZg0KPiB0aGVyZSBhcmUgYW55IG9uIHRoZSBsaXN0Lg0KDQpJTUhPIHRoYXQncyBuZWFybHkg
d2hhdCBSb2JpbidzIHBhdGNoZXMgZG9lcywgc28gdGhpcyBzaG91bGQgYmUgc3VmZmljaWVudDoN
ClB1dHRpbmcgdGhlIGRlc2NyaXB0b3JzIHRvIGZyZWUgaW4gYW4gZXh0cmEgdGVybWluYXRpb24g
bGlzdCBhbmQgZW5zdXJpbmcNCnRoYXQgYSBuZXcgdHJhbnNmZXIgaXMgaGFuZGxlZCBhZnRlciB0
aGUgbGFzdCB0ZXJtaW5hdGlvbiBpcyBkb25lLg0KDQoNCkBSb2JpbjoNCklzIGl0IHBvc3NpYmxl
IHRvIHRhZyB0aGUgY29tbWl0cyBmb3IgdGhlIHN0YWJsZS10cmVlDQpDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZz8NCg0KQmVzdCByZWdhcmRzIGFuZCB0aGFuayB5b3UgYWxsIQ0KQmVuamFtaW4N
ClJpY2hhcmQNCg0K
