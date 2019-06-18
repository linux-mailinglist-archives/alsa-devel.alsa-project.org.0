Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5B4A4C9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 17:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72EB516D9;
	Tue, 18 Jun 2019 17:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72EB516D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560870469;
	bh=jgBH38ni31el72zuso0mCcyusavz/pp2ZJHLyVGML+8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jldmEgFpKfRBX9mhVLsclukqDYQVP8C9RaZK3mXlV8UyginLq7wMAncj4aYzwEmKE
	 DR9c1tdxhpvB+0C/VT6qDZUwibpezvlc318kb63bpjQrzlkugfxl4FeJNwYYHLimWc
	 FLLyI8v0nQvSds1zBvHBxiEV0UR0rDx3IkviMQA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAECF896DB;
	Tue, 18 Jun 2019 17:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 635ECF896F4; Tue, 18 Jun 2019 17:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95B14F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 17:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95B14F89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="js0EnFWk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WssxiHgd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DB0D522475;
 Tue, 18 Jun 2019 11:05:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 11:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=U
 o4cP9YHiGXQgNzjLC8k3zHcCrW8fo8SqzSSPW0Il4c=; b=js0EnFWkFLxIeDNNC
 l5YvjgSmp7ZsXyictnSSNaG3lTBXkr0Q1gr3ssnzjUOfhjeW5CmceFpMBcr8a3c5
 bKPuP6y37/wwyn50p0yYi++kPRJcTo4x1AYb0HscztUo1eGVssBB5MY8UFEwXcem
 XhK2wtigePg+8RqRgT901e/S+KQbqaa2PWeswIlB2wtO6+/YDY4fxmzV5GhVdGRL
 NiM9CHWpUT4v4ALb1AGVnjMCci/EGm0Ohxz91rRuXh8KEMLvFo0Pm4wvYAmuUVbf
 0DVVrVKAOTIcT1th/f76YZ/48YfmM3S7bHhChpalgrhjs/NX4R1Q56szMXGauz2q
 dbnTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Uo4cP9YHiGXQgNzjLC8k3zHcCrW8fo8SqzSSPW0Il
 4c=; b=WssxiHgdE/ctnXzjFnRj6MNo8lCKh6q32D5is4G7UN8z7vNeMZZeVgUSE
 Tborm/8TSdQfDphPHdEAnoICZqulvSM/U5mHvgCQCV9q+INzlh3we13+d23GR1vt
 x4Cvy8kJ0EjMazBmtJHaWtlr+bE5dUrlfxBPCboovcA/QUbNzU5F93a+89dv8Ps9
 LlJVNnJ/bel8l26W8uF3iBjcNG8v/vOdrS2jC0r8forii70AFF953FcOl7cnRVjl
 xWGPploiFnA/+obAD0ER7UivgOTaHAHjaDqWFN4TcNtCOYvfuMAzps4UZ66JAqBN
 7SlKFWosYpDg7JVCUfZ4Utsj7LVPQ==
X-ME-Sender: <xms:0_0IXadWLeoG1GhNStoD7KBNTZ5kXA95LNN7VT3_5LXIwJkMSFq8oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjggfsehtke
 ertddtreejnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinhepkhgvrhhnvghlrd
 horhhgpdhgihhthhhusgdrtghomhenucfkphepudegrdefrdejhedrudekudenucfrrghr
 rghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:0_0IXRDvrSB7pOk0xvXoUACcBSDhWp3ZD0nax4KDgYfxRni3HQUW9w>
 <xmx:0_0IXdwHmdVUgw8fXQBbIXqudzzVbMQFc9Yz-I_aDS31mnpo9qPBzA>
 <xmx:0_0IXYEBWzpwq77vU-Gs-V5WbIyct2Zh4H6b9TIylEHMAOLdN2lhNg>
 <xmx:1P0IXdkqk56S_G4IX0q_9Us98u52sw0nQvUw9JklnWfJjZG6vzO30Q>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69F43380087;
 Tue, 18 Jun 2019 11:05:53 -0400 (EDT)
Date: Wed, 19 Jun 2019 00:05:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: mznyfn@0pointer.de
Message-ID: <20190618150549.GA2318@workstation>
Mail-Followup-To: mznyfn@0pointer.de, systemd-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de
References: <20190520122724.GA14864@workstation>
 <20190617132642.GA25074@gardel-login>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617132642.GA25074@gardel-login>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: clemens@ladisch.de, alsa-devel@alsa-project.org,
 linux1394-devel@lists.sourceforge.net, systemd-devel@lists.freedesktop.org
Subject: Re: [alsa-devel] udev: Access permission of fw character device in
 which fw node includes unit handled by ALSA
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

SGkgTGVubmFydCwKClRoYW5rcyBmb3IgeW91ciByZXBseSwgYW5kIG5vdGljZSB0byB0aGlzIGxl
Z2FjeSBhbmQgbWlub3IgaXNzdWUgOykKCk9uIE1vbiwgSnVuIDE3LCAyMDE5LCBhdCAyMjoyNiwg
TGVubmFydCBQb2V0dGVyaW5nIHdyb3RlOgo+IE9uIE1vLCAyMC4wNS4xOSAyMToyNywgVGFrYXNo
aSBTYWthbW90byAoby10YWthc2hpQHNha2Ftb2NjaGkuanApIHdyb3RlOgo+IAo+ID4gSGkgYWxs
LAo+ID4KPiA+IEknbSBhbiBBTFNBIGRldmVsb3BlciwgbWFpbmx5IGNvbW1pdHRpbmcgdG8gZHJp
dmVycyBmb3IgYXVkaW8gYW5kCj4gPiBtdXNpYyB1bml0cyBvbiBJRUVFIDEzOTQgYnVzICh5ZXMs
IGl0J3MgbGVnYWN5IEZpcmVXaXJlKS4gSSBoYXZlIGEKPiA+IGNvbmNlcm4gYWJvdXQgYWNjZXNz
IHBlcm1pc3Npb24gZm9yIGZ3IGNoYXJhY3RlciBkZXZpY2UuCj4gCj4gSSBhbSBub3Qgc3VyZSBJ
IHVuZGVyc3RhbmQgZmlyZXdpcmUgd2VsbCBlbm91Z2ggdG8gc2F5IHNvbWV0aGluZyB0b28KPiBz
bWFydC4gQnV0IGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZW4gd2UgKGluIHN5c3RlbWQg
dXBzdHJlYW0pCj4gY3VycmVudGx5IG9ubHkgaGF2ZSB0aGVzZSBmb3VyIGZpcmV3aXJlIHNwZWNp
ZmljIHJ1bGVzIGluIG91ciB0cmVlOgo+IAo+ICAgU1VCU1lTVEVNPT0iZmlyZXdpcmUiLCBBVFRS
e3VuaXRzfT09IioweDAwYTAyZDoweDAwMDEwKiIsIEdST1VQPSJ2aWRlbyIKPiAgIFNVQlNZU1RF
TT09ImZpcmV3aXJlIiwgQVRUUnt1bml0c309PSIqMHgwMGIwOWQ6MHgwMDAxMCoiLCBHUk9VUD0i
dmlkZW8iCj4gICBTVUJTWVNURU09PSJmaXJld2lyZSIsIEFUVFJ7dW5pdHN9PT0iKjB4MDBhMDJk
OjB4MDEwMDAxKiIsIEdST1VQPSJ2aWRlbyIKPiAgIFNVQlNZU1RFTT09ImZpcmV3aXJlIiwgQVRU
Unt1bml0c309PSIqMHgwMGEwMmQ6MHgwMTQwMDEqIiwgR1JPVVA9InZpZGVvIgo+IAo+IEFuZCBh
bGwgb2YgdGhlc2UgYXJlIGhhbmRsZWQgYnkgc29tZSBmaXJld2lyZSBjb3JlIGRyaXZlcj8KCkFs
dGhvdWdoIGl0J3MgcHJvYmFibGUgdGhhdCBzb21lIG9mIHRoZW0gYXJlIGhhbmRsZWQgYnkgaW4t
a2VybmVsCmRyaXZlciAocGVyaGFwcyBmaXJlZHR2LmtvKSwgdGhleSdyZSBqdXN0IGZvciB1c2Vy
c3BhY2UgYXBwbGljYXRpb25zLgpUaGUgaW4ta2VybmVsIGRyaXZlciBhZGRzIGFub3RoZXIgZGV2
aWNlIHRvIHN5c3RlbSAoaW4gdGhpcyBjYXNlCnZpZGVvIGNoYXJhY3RlciBkZXZpY2UpIGFuZCBh
Y2Nlc3MgcnVsZXMgdG8gaXQgYXJlIGFwYXJ0IGZyb20gdGhlIG9uZQpmb3IgZncgY2hhcmFjdGVy
IGRldmljZSwgYXMgbG9uZyBhcyBhbGwgZmVhdHVyZXMgYXJlIGltcGxlbWVudGVkIGluCnRoZSBp
bi1rZXJuZWwgZHJpdmVyLgoKSW4gYSBjYXNlIG9mIGRyaXZlcnMgaW4gQUxTQSBmaXJld2lyZSBz
dGFjaywgd2UgZGVjaWRlZCB0byBpbXBsZW1lbnQKYSBwYXJ0IG9mIGZlYXR1cmVzIGluIHVzZXJz
cGFjZSBhcHBsaWNhdGlvbiwgZHVlIHRvIHRoZSBjb21wbGV4aXR5IG9mCnZlbmRvci1kZXBlbmRl
bnQgcHJvdG9jb2xzLiBUaGUgaW4ta2VybmVsIGRyaXZlcnMganVzdCBpbXBsZW1lbnQKaXNvY2hy
b25vdXMgcGFja2V0IHN0cmVhbWluZyBmb3IgUENNIGZyYW1lcyBhbmQgTUlESSBtZXNzYWdlcywg
YW5kCnRlbGxzIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdGhlIHJlbGF0ZWQgZncgY2hhcmFjdGVy
IGRldmljZSB2aWEKQUxTQSBod2RlcCBpbnRlcmZhY2VbMV0uCgo+IFRoZSBkZXZpY2VzIHlvdSBj
YXJlIGFib3V0LCBob3cgd291bGQgdGhlIHJ1bGVzIGxvb2sgbGlrZSBmb3IgdGhpcz8KCkhlcmUs
IEknZCBsaWtlIHRvIGV4cGxhaW4gYWJvdXQgdGhlIHJlbGF0aW9uc2hpcHMgYmV0d2VlbiBpbnN0
YW5jZXMgb24KSUVFRSAxMzk0IGJ1cyB0b3BvbG9neSBhbmQgZncgY2hhcmFjdGVyIGRldmljZSwg
bW9kYWxpYXMgb24gaW4ta2VybmVsCmRyaXZlci4KCmBgYApJRUVFIDEzOTQgYnVzCiArIG5vZGUg
QSAgICAgICAgKD1mdyBjaGFyYWN0ZXIgZGV2aWNlLCAvZGV3L2Z3MCkKICAgICsgdW5pdCBBMSAg
ICAoPW1vZGFsaWFzIG9uIGluLWtlcm5lbCBkcml2ZXIsIGZ3MC4wKQogICAgKyB1bml0IEIyICAg
ICg9bW9kYWxpYXMgb24gaW4ta2VybmVsIGRyaXZlciwgZncwLjEpCiAgICArIC4uLgogKyBub2Rl
IEIgICAgICAgICg9ZncgY2hhcmFjdGVyIGRldmljZSwgL2Rldi9mdzEpCiAgICArIHVuaXQgQjEg
ICAgKD1tb2RhbGlhcyBvbiBpbi1rZXJuZWwgZHJpdmVyLCBmdzEuMCkKICAgICsgdW5pdCBCMiAg
ICAoPW1vZGFsaWFzIG9uIGluLWtlcm5lbCBkcml2ZXIsIGZ3MS4xKQogICAgKyAuLi4KICsgLi4u
CmBgYAoKVGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIG5vZGUvdW5pdCBpcyBzaW1pbGFyIHRvIGRl
dmljZS9pbnRlcmZhY2UgaW4KVVNCIGNhc2UuIE9uZSBub2RlIGNhbiBpbmNsdWRlcyBzZXZlcmFs
IHVuaXRzIHdoaWNoIHJlcHJlc2VudAphY3R1YWwgZnVuY3Rpb25hbGl0aWVzLCBhbmQgYW55IGlu
LWtlcm5lbCBkcml2ZXIgaXMgYm91bmQgdG8gb25lIG9mIHRoZQp1bml0cy4gT24gdGhlIG90aGVy
IGhhbmQsIGZ3IGNoYXJhY3RlciBkZXZpY2UgaXMgYWRkZWQgZm9yIGVhY2ggbm9kZS4KVGhlIG5v
ZGUgaXMgc3ViamVjdCBvZiBjb21tdW5pY2F0aW9uLgoKV2hlbiBhbnkgZHJpdmVyIGluIEFMU0Eg
ZmlyZXdpcmUgc3RhY2sgaXMgYm91bmQgdG8gb25lIG9mIHVuaXRzIGluIGEgbm9kZSwKSSBleHBl
Y3QgdWRldmQgdG8gY2hhbmdlIGdyb3VwIG9mIHRoZSBjb3JyZXNwb25kaW5nIGZ3IGNoYXJhY3Rl
ciBkZXZpY2UgdG8KJ2F1ZGlvJywgYW5kIGV4cGVjdCBsb2dpbmQgdG8gYXNzaWduIEFDTCB0byBp
dC4KCiArIG5vZGUgQSAgICAoZncgY2hhcmFjdGVyIGRldmljZSB3aXRoICdhdWRpbycgZ3JvdXAs
ICt1YWNjZXNzKQogICArIHVuaXQgQTEgKGFueSBkcml2ZXIgaW4gQUxTQSBmaXJld2lyZSBzdGFj
ayBpcyBib3VuZCB0bykKCkluIGN1cnJlbnQgZnJhbWV3b3JrIG9mIHVkZXYgcnVsZSwgdGhpcyBz
ZWVtcyB0byBiZSBkaWZmaWN1bHQgdG8gYWNoaWV2ZSwKaW4gbXkgb3Bpbmlvbi4gVGh1cywgaWYg
SSBtYW5hZ2VkIHRvIGFjaGlldmUgaXQgYnkgcnVsZSBmcmFtZXdvcmssCkkgd291bGQgYWRkIGFu
ZCBtYWludGFpbiBtYW55IGVudHJpZXMgZ2VuZXJhdGVkIGZyb20gbXkgcmVnaXN0cnlbMl0uCgo+
IEluIGdlbmVyYWwsIHdoZW4gaXQgY29tZXMgdG8gYXV0by1sb2FkaW5nIG9mIGRyaXZlcnMgd2Ug
dXN1YWxseSBleHBlY3QKPiB0aGUga2VybmVsIHRvIGFkZCBtb2RhbGlhcyBtZXRhZGF0YSB0byAu
a28gZmlsZXMuCj4KPiBJbiB0aGUgaHdkYiB1c3VhbGx5IG1vc3RseSBvbmx5ICJhdXhpbGlhcnki
IGRhdGEgaXMgc3RvcmVkLCBpLmUuIHN0dWZmCj4gdGhhdCBpcyBncmVhdCB0byBoYXZlIGJ1dCBp
cyBub3QgZXNzZW50aWFsIGZvciBhIGRldmljZSB0byB3b3JrCj4gYmFzaWNhbGx5Lgo+Cj4gUnVs
ZXMgZmlsZXMgc2hvdWxkIGdlbmVyYWxseSBiZSBrZXB0IHNob3J0LiBpLmUuIGlmIHlvdSBhZGQg
MyBtb3JlCj4gcnVsZXMgZm9yIHRoZSBkZXZpY2VzIHlvdSBjYXJlIGFib3V0LCB0aGF0J2QgYmUg
ZmluZSDigJQgaWYgeW91IGFkZCAxMDAsCj4gdGhlbiB0aGF0J3Mgbm90IHNvIGdyZWF0IGhvd2V2
ZXIsIGFuZCBhbm90aGVyIGFwcHJvYWNoIHNob3VsZCBiZQo+IGZvdW5kLgoKWWVzLiBJJ2QgbGlr
ZSB0byBhdm9pZCBpbmNyZWFzaW5nIG1haW50ZW5hbmNlIGNvc3Qgb2YgYW55Ym9keSBpbmNsdWRp
bmcKbXlzZWxmLi4uCgo+IEFueXdheSwgZ2l2ZW4gdGhhdCBJIGFtIG5vdCBhIGZpcmV3aXJlIHBy
bywgSSBmaWd1cmUgeW91IGhhdmUgdG8KPiBkZWNpZGUgeW91cnNlbGYgd2hhdCB0aGUgYmVzdCBh
cHByb2FjaCBpcywgYW5kIHRoZW4gcHJlcCBhIFBSIGFuZCB3ZQo+IGNhbiBoYXZlIGEgbG9vay4g
V2l0aG91dCBsb29raW5nIGF0IGFuIChtYXliZSBqdXN0IFJGQykgcGF0Y2ggSSBhbSBub3QKPiBz
dXJlIEkgZ3JvayBlbnVnaCB0byBwcm9wZXJseSBjb21tZW50IG9uIGl0LgoKT2theS4gSSdsbCBh
dHRlbXB0IHRvIHBvc3Qgc2V2ZXJhbCBSRkMgcGF0Y2hlcy4gSXQgdGFrZXMgbWUgYSBiaXQgbG9u
Zwp0aW1lIGJlY2F1c2UgdGhpcyBpcyBteSBmaXJzdCBhdHRlbXB0IHRvIGNvbW1pdCBzeXN0ZW1k
LCBidXQgSSdtIGhhcHB5CmlmIHlvdSByZXZpZXcgYW5kIGNvbW1lbnQgdG8gdGhlbS4KClsxXSBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9pbmNsdWRlL3VhcGkvc291bmQvZmlyZXdpcmUuaCNuOTMKWzJdIGh0dHBz
Oi8vZ2l0aHViLmNvbS90YWthc3dpZS9hbS1jb25maWctcm9tcwoKClRoYW5rcwoKVGFrYXNoaSBT
YWthbW90bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
