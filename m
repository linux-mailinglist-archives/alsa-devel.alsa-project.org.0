Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A791DEF0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5365C20C1;
	Mon,  1 Jul 2024 14:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5365C20C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836421;
	bh=JxUPOxYsMIfiP6xhCcn3ZGkQmnWoI03MVeDw2heEwzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QXZ8ganLyymwSkOrpAvzncgtvH6oK7vdlJk1ljqvRip+dEZjVsSrBXF9xLd/kJV8g
	 C80ReWJXCoQXOC+P3i3p0+SFeAfcfk+W7ylo+q9rqlGgPXlIBjupOWA5J3SJ/j1OT2
	 WpVXrZzb1UYoNSONofp5ukktTs05VGw6/9mD8c5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27F89F805B0; Mon,  1 Jul 2024 14:19:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30050F805AF;
	Mon,  1 Jul 2024 14:19:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8D85F8023A; Wed, 19 Jun 2024 19:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A054F800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 19:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A054F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WqCrqy39
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6326f1647f6so28067b3.0
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jun 2024 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718819908; x=1719424708;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0W/vdHfkhgfz+RKFyOYCaas7vzfDhTjjCxQvgWC6yU=;
        b=WqCrqy39UCmp9PeF0BQi03qO6CxxtrerRro+awGxCXYCq31TDyffvf4iPlVCCYI3tO
         pTr0VT5intwN+RphPvi6TsWNBCPfmP4OwJ2H4Mjmqk8K5sVIu0hQ/+aZM3L2JkFcVBLY
         cMTz6hiK7UAtRdd5ZNxchfFz6TVFS7S+ti5mLa0knRI67UkquxThLzPmmsM0ddiJD2l2
         3G+IYecaJjC1U3YDN7eCYJpIGP9vbDN/nOsapGdPyCwkzGgc57i8BFUt9mS0GvkDkYis
         OszCpMKOmmDKuGlM/aJ0m9ctd+fyKoAmWQvoa+K8Q67ILczPY6m6vovPLkckdZW4E4pH
         3NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718819908; x=1719424708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0W/vdHfkhgfz+RKFyOYCaas7vzfDhTjjCxQvgWC6yU=;
        b=sNVf5eYA2kbn+b4nD26BygiZlzWRjeqhxmHtIxeuzmlw/iM3ONlU9eos1lawNLIFqh
         Bh3rlcQHtmivDh1Z1ekipvPpeBZfCDTI1tImw5gM/yIHB0XGG4eUjlHNiON7nYzcNwyb
         G5PNTqOP1w9Oi5tPjaZgkj18SUvujlGtB3FvnPq+Xje/Fe93dnSFMhDYB6RRfBxP850F
         18vIkjbYru8xbVBvTlX6vcv+XkfyVBXOEKqG2oGITqaKIUZq6DMFyc9ZqOKLMcp7FZ51
         vMqSABSI15ICdDbtwkb0oQQcCHgX27cyH9BbPik2br14xtW92ED+GJU9bI8ZqFwqQwFU
         PNFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNR6h3uDCuDx79W45g7LW+GU57aUi4/oZUwa8pyC5WTIwvc5HXN988ZajPYC2G6JaKVjpbwXGub7t6SLf94rtLI1/CHWFmlaaM2Z8=
X-Gm-Message-State: AOJu0Yxz1xcW6USviH0Odz9Pu1RxS/GGHx8929grmFBt0YakpedZQro6
	vV/mJB/XBDhJL6GuchtiQSXdGej8nXalukY+TBzwFrjpWPZghUmVGr7JjsfnyiXJDBgDZB6anyb
	A/pdBKOTRGpXNK47mtVUBgnv98FY=
X-Google-Smtp-Source: 
 AGHT+IG6nj2+Bd4IOky+UlIbOAywXKETJ0JPJa97s7ozDwuGAFhpR/MFupjTeclsuTUm0wsa6autE+NGQ5ep2ysJ4XY=
X-Received: by 2002:a81:a0d2:0:b0:632:a329:921b with SMTP id
 00721157ae682-63a8d737b59mr33040377b3.1.1718819908359; Wed, 19 Jun 2024
 10:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240616203231.43724-1-av2082000@gmail.com>
 <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
In-Reply-To: <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Wed, 19 Jun 2024 23:28:16 +0530
Message-ID: 
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com,
 skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
X-MailFrom: av2082000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3A44QB77ZBLT7G2GW3IKMNN4PZ6L7EFL
X-Message-ID-Hash: 3A44QB77ZBLT7G2GW3IKMNN4PZ6L7EFL
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:19:45 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3A44QB77ZBLT7G2GW3IKMNN4PZ6L7EFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgUmljYXJkbywNCg0KSSBoYXZlIHJlYnVpbHQgaXQgYWdhaW4sIGFuZCB0aGVyZSBhcmUgbm8g
YW55IHdhcm5pbmdzIG9yIGVycm9ycy4NCg0KVGhhbmtzDQpBbWl0IHYNCg0KT24gTW9uLCAxNyBK
dW4gMjAyNCBhdCAyMjo0MSwgUmljYXJkbyBCLiBNYXJsaWVyZSA8cmljYXJkb0BtYXJsaWVyZS5u
ZXQ+DQp3cm90ZToNCg0KPiBPbiAxNyBKdW4gMjQgMDI6MDIsIEFtaXQgVmFkaGF2YW5hIHdyb3Rl
Og0KPiA+IFRoZSBwbGFjZW1lbnQgb2YgdGhlIGBzZWdkaXN0X2NvZGVzYCBhcnJheSBkb2N1bWVu
dGF0aW9uIHdhcyBjb3JyZWN0ZWQNCj4gPiB0byBjb25mb3JtIHdpdGgga2VybmVsIGRvY3VtZW50
YXRpb24gZ3VpZGVsaW5lcy4gVGhlIGBAc2VnZGlzdF9jb2Rlc2ANCj4gPiB3YXMgcGxhY2VkIGlu
Y29ycmVjdGx5IHdpdGhpbiB0aGUgc3RydWN0IGBzZWdkaXN0X2NvZGVgIGRvY3VtZW50YXRpb24N
Cj4gPiBibG9jaywgd2hpY2ggbGVkIHRvIGEgcG90ZW50aWFsIG1pc2ludGVycHJldGF0aW9uIG9m
IHRoZSBjb2RlIHN0cnVjdHVyZS4NCj4gPg0KPiA+IFRoZSBgc2VnZGlzdF9jb2Rlc2AgYXJyYXkg
ZG9jdW1lbnRhdGlvbiB3YXMgbW92ZWQgb3V0c2lkZSB0aGUgc3RydWN0DQo+ID4gYmxvY2ssIGFu
ZCBhIHNlcGFyYXRlIGNvbW1lbnQgYmxvY2sgd2FzIHByb3ZpZGVkIGZvciBpdC4gVGhpcyBjaGFu
Z2UNCj4gPiBlbnN1cmVzIHRoYXQgY2xhcml0eSBhbmQgcHJvcGVyIGFsaWdubWVudCB3aXRoIGtl
cm5lbCBkb2N1bWVudGF0aW9uDQo+ID4gc3RhbmRhcmRzIGFyZSBtYWludGFpbmVkLg0KPiA+DQo+
ID4gQSBrZXJuZWwtZG9jIHdhcm5pbmcgd2FzIGFkZHJlc3NlZDoNCj4gPiAgICAgLi9kcml2ZXJz
L3NsaW1idXMvc3RyZWFtLmM6NDk6IHdhcm5pbmc6IEV4Y2VzcyBzdHJ1Y3QgbWVtYmVyDQo+ICdz
ZWdkaXN0X2NvZGVzJyBkZXNjcmlwdGlvbiBpbiAnc2VnZGlzdF9jb2RlJw0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQW1pdCBWYWRoYXZhbmEgPGF2MjA4MjAwMEBnbWFpbC5jb20+DQo+ID4gLS0t
DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgICAgLSBSZW1vdmVkIGBzdGF0aWMgY29uc3RgIGtl
eXdvcmQgZnJvbSBgc2VnZGlzdF9jb2RlYCBzdHJ1Y3R1cmUNCj4gZGVjbGFyYXRpb24uDQo+ID4N
Cj4gPiAgZHJpdmVycy9zbGltYnVzL3N0cmVhbS5jIHwgOCArKysrKy0tLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc2xpbWJ1cy9zdHJlYW0uYyBiL2RyaXZlcnMvc2xpbWJ1cy9zdHJlYW0u
Yw0KPiA+IGluZGV4IDFkNmIzODY1NzkxNy4uODYzYWIzMDc1ZDdlIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvc2xpbWJ1cy9zdHJlYW0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvc2xpbWJ1cy9zdHJl
YW0uYw0KPiA+IEBAIC0xOCwxNSArMTgsMTcgQEANCj4gPiAgICogICAgICAgICAgIGFuZCB0aGUg
Zmlyc3Qgc2xvdCBvZiB0aGUgbmV4dCAgY29uc2VjdXRpdmUgU2VnbWVudC4NCj4gPiAgICogQHNl
Z2Rpc3RfY29kZTogU2VnbWVudCBEaXN0cmlidXRpb24gQ29kZSBTRFsxMTowXQ0KPiA+ICAgKiBA
c2VnX29mZnNldF9tYXNrOiBTZWdtZW50IG9mZnNldCBtYXNrIGluIFNEWzExOjBdDQo+ID4gLSAq
IEBzZWdkaXN0X2NvZGVzOiBMaXN0IG9mIGFsbCBwb3NzaWJsZSBTZWdtZXQgRGlzdHJpYnV0aW9u
IGNvZGVzLg0KPiA+ICAgKi8NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBzZWdkaXN0X2NvZGUg
ew0KPiA+ICtzdHJ1Y3Qgc2VnZGlzdF9jb2RlIHsNCj4gPiAgICAgICBpbnQgcmF0ZW07DQo+ID4g
ICAgICAgaW50IHNlZ19pbnRlcnZhbDsNCj4gPiAgICAgICBpbnQgc2VnZGlzdF9jb2RlOw0KPiA+
ICAgICAgIHUzMiBzZWdfb2Zmc2V0X21hc2s7DQo+ID4NCj4gPiAtfSBzZWdkaXN0X2NvZGVzW10g
PSB7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsvKiBzZWdkaXN0X2NvZGVzIC0gTGlzdCBvZiBhbGwg
cG9zc2libGUgU2VnbWVudCBEaXN0cmlidXRpb24gY29kZXMuICovDQo+ICAgICAgIF4gaXNuJ3Qg
YSAnQCcgY2hhcmFjdGVyIG1pc3NpbmcgaGVyZT8NCj4NCj4gTWFrZSBzdXJlIHRvIHJlLWJ1aWxk
IHRoZSBkb2NzIGFuZCBzZWUgd2hldGhlciBpdCBsb29rcyBmaW5lLg0KPg0KPiBUaGFua3MsDQo+
IC0gICAgICAgUmljYXJkby4NCj4NCj4NCj4NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzZWdk
aXN0X2NvZGUgc2VnZGlzdF9jb2Rlc1tdID0gew0KPiA+ICAgICAgIHsxLCAgICAgMTUzNiwgICAw
eDIwMCwgICAweGRmZn0sDQo+ID4gICAgICAgezIsICAgICA3NjgsICAgIDB4MTAwLCAgIDB4Y2Zm
fSwNCj4gPiAgICAgICB7NCwgICAgIDM4NCwgICAgMHgwODAsICAgMHhjN2Z9LA0KPiA+IC0tDQo+
ID4gMi4yNS4xDQo+ID4NCj4gPg0KPg0K
