Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A2724581
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 16:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5521782A;
	Tue,  6 Jun 2023 16:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5521782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686061001;
	bh=dhZlUfY0pFZAMI2VLj9bUBNix8Tu/qM6B8EQNFPUd/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QClnOXF0oI0F7klf6k+XI3P73o/Y80jX5KaRr4pggAC8GLWSglkEYo3itDHaB2EeL
	 qPiUi8eCRgYuVn30ICiBIGsZY7CB41YX2dEd3rZ8Haqm4S+FG4tGANAB0tx9nAY2QT
	 LWz4gBbhAvbktO/KYs6eu9aNuKsdCfkxGJKVaCRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA25F80155; Tue,  6 Jun 2023 16:15:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31289F80155;
	Tue,  6 Jun 2023 16:15:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 202A5F80199; Tue,  6 Jun 2023 14:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ACBBF800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 14:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ACBBF800ED
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxPPA9I39k_icAAA--.758S3;
	Tue, 06 Jun 2023 20:14:53 +0800 (CST)
Received: from [192.168.100.8] (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxJeQ8I39kfFQCAA--.9693S3;
	Tue, 06 Jun 2023 20:14:53 +0800 (CST)
Message-ID: <3f8ac669-0ca5-e1fa-0e9c-033562705bb1@loongson.cn>
Date: Tue, 6 Jun 2023 20:14:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/4] ALSA: hda: Workaround for SDnCTL register on loongson
 controller
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, chenhuacai@loongson.cn,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Yingkun Meng <mengyingkun@loongson.cn>
References: <cover.1685501806.git.siyanteng@loongson.cn>
 <74a63661726b8c44be72bf3bd35a3259f2ae2e6a.1685501806.git.siyanteng@loongson.cn>
 <87r0qqicn8.wl-tiwai@suse.de>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <87r0qqicn8.wl-tiwai@suse.de>
X-CM-TRANSID: AQAAf8AxJeQ8I39kfFQCAA--.9693S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrW8WF4xArW7ZrW5Zw4fWFX_yoW8AF4fpw
	s5AayrKFsrtF109F4Yk345KF15KFWxJasrtrWFyw18Awn2qr1FqF1jyr48XFy0kryagrW3
	ZFW3t34kXay5uFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJUUUkEb4IE77IF4wAF
	F20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r
	1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAF
	wI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67
	AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjxv20xvE14v26r126r1DMc
	Ij6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480
	Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UM5l8UUUUU=
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SC5CKAC6CFVDHGF5FLDKC7DFKISHVDE3
X-Message-ID-Hash: SC5CKAC6CFVDHGF5FLDKC7DFKISHVDE3
X-Mailman-Approved-At: Tue, 06 Jun 2023 14:14:54 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SC5CKAC6CFVDHGF5FLDKC7DFKISHVDE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAyMDIzLzYvNSAxNTozNiwgVGFrYXNoaSBJd2FpIHdyb3RlOg0KPiBPbiBXZWQsIDMxIE1h
eSAyMDIzIDA1OjIxOjMzICswMjAwLA0KPiBZYW50ZW5nIFNpIHdyb3RlOg0KPj4gT24gbG9vbmdz
b24gY29udHJvbGxlciwgYWZ0ZXIgY2FsbGluZyBzbmRfaGRhY19zdHJlYW1fdXBkYXRlYigpDQo+
PiB0byBlbmFibGUgRE1BIGVuZ2luZSwgdGhlIFNEbkNUTC5TVFJNIHdpbGwgYmVjb21lIHRvIHpl
cm8uICBXZQ0KPj4gbmVlZCB0byBhY2Nlc3MgU0RuQ1RMIGluIGR3b3JkIHRvIGtlZXAgU0RuQ1RM
LlNUUk0gaXMgbm90IGNoYW5nZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaTxz
aXlhbnRlbmdAbG9vbmdzb24uY24+DQo+PiBTaWduZWQtb2ZmLWJ5OiBZaW5na3VuIE1lbmc8bWVu
Z3lpbmdrdW5AbG9vbmdzb24uY24+DQo+PiAtLS0NCj4+ICAgc291bmQvaGRhL2hkYWNfc3RyZWFt
LmMgfCA4ICsrKysrKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2hkYWNfc3RyZWFtLmMg
Yi9zb3VuZC9oZGEvaGRhY19zdHJlYW0uYw0KPj4gaW5kZXggMWY1NmZkMzNiOWFmLi45MGZiZjlm
ZWEyYjMgMTAwNjQ0DQo+PiAtLS0gYS9zb3VuZC9oZGEvaGRhY19zdHJlYW0uYw0KPj4gKysrIGIv
c291bmQvaGRhL2hkYWNfc3RyZWFtLmMNCj4+IEBAIC0xMyw2ICsxMyw3IEBADQo+PiAgICNpbmNs
dWRlIDxzb3VuZC9oZGF1ZGlvLmg+DQo+PiAgICNpbmNsdWRlIDxzb3VuZC9oZGFfcmVnaXN0ZXIu
aD4NCj4+ICAgI2luY2x1ZGUgInRyYWNlLmgiDQo+PiArI2luY2x1ZGUgIi4uL3BjaS9oZGEvaGRh
X2NvbnRyb2xsZXIuaCINCj4+ICAgDQo+PiAgIC8qDQo+PiAgICAqIHRoZSBoZGFjX3N0cmVhbSBs
aWJyYXJ5IGlzIGludGVuZGVkIHRvIGJlIHVzZWQgd2l0aCB0aGUgZm9sbG93aW5nDQo+PiBAQCAt
MTMwLDYgKzEzMSw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKHNuZF9oZGFjX3N0cmVhbV9pbml0KTsN
Cj4+ICAgdm9pZCBzbmRfaGRhY19zdHJlYW1fc3RhcnQoc3RydWN0IGhkYWNfc3RyZWFtICphenhf
ZGV2KQ0KPj4gICB7DQo+PiAgIAlzdHJ1Y3QgaGRhY19idXMgKmJ1cyA9IGF6eF9kZXYtPmJ1czsN
Cj4+ICsJc3RydWN0IGF6eCAqY2hpcCA9IGJ1c190b19hengoYnVzKTsNCj4+ICAgCWludCBzdHJp
cGVfY3RsOw0KPj4gICANCj4+ICAgCXRyYWNlX3NuZF9oZGFjX3N0cmVhbV9zdGFydChidXMsIGF6
eF9kZXYpOw0KPj4gQEAgLTE1MCw3ICsxNTIsMTEgQEAgdm9pZCBzbmRfaGRhY19zdHJlYW1fc3Rh
cnQoc3RydWN0IGhkYWNfc3RyZWFtICphenhfZGV2KQ0KPj4gICAJCQkJCXN0cmlwZV9jdGwpOw0K
Pj4gICAJfQ0KPj4gICAJLyogc2V0IERNQSBzdGFydCBhbmQgaW50ZXJydXB0IG1hc2sgKi8NCj4+
IC0Jc25kX2hkYWNfc3RyZWFtX3VwZGF0ZWIoYXp4X2RldiwgU0RfQ1RMLA0KPj4gKwlpZiAoY2hp
cC0+ZHJpdmVyX2NhcHMgJiBBWlhfRENBUFNfTE9PTkdTT05fV09SS0FST1VORCkNCj4+ICsJCXNu
ZF9oZGFjX3N0cmVhbV91cGRhdGVsKGF6eF9kZXYsIFNEX0NUTCwNCj4+ICsJCQkJMCwgU0RfQ1RM
X0RNQV9TVEFSVCB8IFNEX0lOVF9NQVNLKTsNCj4+ICsJZWxzZQ0KPj4gKwkJc25kX2hkYWNfc3Ry
ZWFtX3VwZGF0ZWIoYXp4X2RldiwgU0RfQ1RMLA0KPj4gICAJCQkJMCwgU0RfQ1RMX0RNQV9TVEFS
VCB8IFNEX0lOVF9NQVNLKTsNCj4gU2ltaWxhcmx5IGxpa2UgdGhlIHBhdGNoIDIsIHRoaXMgaGFz
IHRvIGJlIGhhbmRsZWQgd2l0aCBhIG5ldyBmbGFnDQo+IGFkZGVkIHRvIHN0cnVjdCBoZGFjX2J1
cy4NCg0KT2theSwgSSdsbCBkbyBpdCByaWdodCBub3cuDQoNCg0KVGhhbmtzLA0KDQpZYW50ZW5n
DQoNCj4NCj4NCj4gVGFrYXNoaQ==
