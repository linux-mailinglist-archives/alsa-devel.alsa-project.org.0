Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7591DEF1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CCB62355;
	Mon,  1 Jul 2024 14:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CCB62355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836434;
	bh=TgY4vj43ZWP8Wj/jL3dQHq5QZ2KcnkDB+pG933M5ncY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Any9oH8Xw2ZKixQv/VFXI+f+4rShfLvcTsv0+yDv8/EhMRTSWOKWqA6H8ls2feqWK
	 qQJ8gFIXA/ox4esusBGZVJNPrcY1517Y/kT1CKcbjouX2k/8jQLu+1u8YfLMAKE5S5
	 HbzA+IezBlKrTDs+wjuHFaxd1ta1VKOBubZ9Zerw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C847FF805E0; Mon,  1 Jul 2024 14:19:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D24F805CB;
	Mon,  1 Jul 2024 14:19:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3392DF8023A; Wed, 19 Jun 2024 20:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A50D8F8010C
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 20:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50D8F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KjUFuLto
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-632750bf73bso52552907b3.2
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jun 2024 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718820140; x=1719424940;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pKmyiORGrpAZYYIThXmVZH2PQKu1P8LAmURoHGMcooY=;
        b=KjUFuLtob7cRNpP7jpwPs2TJNcTQEZvtA29+wTjgvHad+qX6mN0SEpO2PSMGMJCkPV
         +yOtkbFgpS1sYnSWKO7loQH7mE+8bFo5V3AjO+g8hjEe6VHPWtAqcnk77/SqNXCBvPBO
         pHvex/Xqrovi2hflZtM7xKFIM+8kdiQb0sFJuTzeE53oFrCfAAhQlSvy/2oD5eqLFlUU
         AtdU6oCqG9sP60HN6DfAiHvhxl7WjHzFhfr9GolMsCQfL06rfiPIktu0SnnpCFVbnSAd
         G10lgXMirwLfBxIXk7JuWafirpmj5uhzVtSoJs91jzl9x6CAjqI0NNgW/C0HJgz9yihY
         poAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718820140; x=1719424940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKmyiORGrpAZYYIThXmVZH2PQKu1P8LAmURoHGMcooY=;
        b=e5ZeU+Tx9y6EFYBOaMB+UVg2o8Ub0zwY/bA+5rKNKrWVu980mZ1xkwxlbL/qg9DpF0
         Wg+2fITFG7Dd+lR1/rI9lHLayKgngGVPfqyrLTdoRvmLgTh+/gdZPyQar5gXeWKqXc4w
         TTDmMsL7cfTNtkOP4X3aPGazIFwicNYQlfWWJKwtf4Efr8xcAkclqftSNNCk3pUtkpr9
         6Q/CeJI0NaseXY/K6ncKx8Spkw/0GdcqnFJY14KIO+E9T8lKIG2nzw6qTcCGEGvvaFD4
         Se5rKRGaLW2lUbr5zmNK1yxG0UQUZuCGLqVmRSFWhXuMjyv7o8gDYwm5MZ5VjG/lLHmK
         KFQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWHqVLEjJYYWx725+E4lvlSzXRY+aW4c4r5e4Fv5dQuM8FHe3ITtfX2F+CORnd30MskR5IswxjwKghAA0vq6KmhUjTZytCuPoseQU=
X-Gm-Message-State: AOJu0YxfRPj8yEawmuGAsYIBkkrSD6Xmjdtw00yC5Lf7HIpRFC43tNtp
	0jcBm25/lG1aBqzrLy6Laio9RPvF5YGJHbjoQzTUkdbn9uF8lgVYTacH2gvXhbi7w2H3G6Q53Hz
	S2Zcv3GKRTVfGrTR9ks/SuOyTuws=
X-Google-Smtp-Source: 
 AGHT+IExdF10cfPw4DBx6KQKZm0RMv4jxwwj1jVzp6dzWHRohwsizCYSDiENXKoyLjLaazpt+JIgZbVb6YCocPX+3lg=
X-Received: by 2002:a81:ab42:0:b0:627:dfbd:3175 with SMTP id
 00721157ae682-63a8da1aa3emr39144997b3.10.1718820140399; Wed, 19 Jun 2024
 11:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240616203231.43724-1-av2082000@gmail.com>
 <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
In-Reply-To: 
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Wed, 19 Jun 2024 23:32:08 +0530
Message-ID: 
 <CAPMW_r+vsHvwtqPrUJad0-VSoEiPxX_swMy8VqtR8+kt60aDag@mail.gmail.com>
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
Message-ID-Hash: 2GSTOBAC3F5GUBR7WB2GMVVZDKCJ5M2R
X-Message-ID-Hash: 2GSTOBAC3F5GUBR7WB2GMVVZDKCJ5M2R
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:19:46 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GSTOBAC3F5GUBR7WB2GMVVZDKCJ5M2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAxOSBKdW4gMjAyNCBhdCAyMzoyOCwgQW1pdCBWYWRoYXZhbmEgPGF2MjA4MjAwMEBn
bWFpbC5jb20+IHdyb3RlOg0KDQo+IEhpIFJpY2FyZG8sDQo+DQo+IEkgaGF2ZSByZWJ1aWx0IGl0
IGFnYWluLCBhbmQgdGhlcmUgYXJlIG5vIGFueSB3YXJuaW5ncyBvciBlcnJvcnMuDQo+DQo+IFRo
YW5rcw0KPiBBbWl0IHYNCj4NCj4gT24gTW9uLCAxNyBKdW4gMjAyNCBhdCAyMjo0MSwgUmljYXJk
byBCLiBNYXJsaWVyZSA8cmljYXJkb0BtYXJsaWVyZS5uZXQ+DQo+IHdyb3RlOg0KPg0KPj4gT24g
MTcgSnVuIDI0IDAyOjAyLCBBbWl0IFZhZGhhdmFuYSB3cm90ZToNCj4+ID4gVGhlIHBsYWNlbWVu
dCBvZiB0aGUgYHNlZ2Rpc3RfY29kZXNgIGFycmF5IGRvY3VtZW50YXRpb24gd2FzIGNvcnJlY3Rl
ZA0KPj4gPiB0byBjb25mb3JtIHdpdGgga2VybmVsIGRvY3VtZW50YXRpb24gZ3VpZGVsaW5lcy4g
VGhlIGBAc2VnZGlzdF9jb2Rlc2ANCj4+ID4gd2FzIHBsYWNlZCBpbmNvcnJlY3RseSB3aXRoaW4g
dGhlIHN0cnVjdCBgc2VnZGlzdF9jb2RlYCBkb2N1bWVudGF0aW9uDQo+PiA+IGJsb2NrLCB3aGlj
aCBsZWQgdG8gYSBwb3RlbnRpYWwgbWlzaW50ZXJwcmV0YXRpb24gb2YgdGhlIGNvZGUgc3RydWN0
dXJlLg0KPj4gPg0KPj4gPiBUaGUgYHNlZ2Rpc3RfY29kZXNgIGFycmF5IGRvY3VtZW50YXRpb24g
d2FzIG1vdmVkIG91dHNpZGUgdGhlIHN0cnVjdA0KPj4gPiBibG9jaywgYW5kIGEgc2VwYXJhdGUg
Y29tbWVudCBibG9jayB3YXMgcHJvdmlkZWQgZm9yIGl0LiBUaGlzIGNoYW5nZQ0KPj4gPiBlbnN1
cmVzIHRoYXQgY2xhcml0eSBhbmQgcHJvcGVyIGFsaWdubWVudCB3aXRoIGtlcm5lbCBkb2N1bWVu
dGF0aW9uDQo+PiA+IHN0YW5kYXJkcyBhcmUgbWFpbnRhaW5lZC4NCj4+ID4NCj4+ID4gQSBrZXJu
ZWwtZG9jIHdhcm5pbmcgd2FzIGFkZHJlc3NlZDoNCj4+ID4gICAgIC4vZHJpdmVycy9zbGltYnVz
L3N0cmVhbS5jOjQ5OiB3YXJuaW5nOiBFeGNlc3Mgc3RydWN0IG1lbWJlcg0KPj4gJ3NlZ2Rpc3Rf
Y29kZXMnIGRlc2NyaXB0aW9uIGluICdzZWdkaXN0X2NvZGUnDQo+PiA+DQo+PiA+IFNpZ25lZC1v
ZmYtYnk6IEFtaXQgVmFkaGF2YW5hIDxhdjIwODIwMDBAZ21haWwuY29tPg0KPj4gPiAtLS0NCj4+
ID4gQ2hhbmdlcyBpbiB2MjoNCj4+ID4gICAgIC0gUmVtb3ZlZCBgc3RhdGljIGNvbnN0YCBrZXl3
b3JkIGZyb20gYHNlZ2Rpc3RfY29kZWAgc3RydWN0dXJlDQo+PiBkZWNsYXJhdGlvbi4NCj4+ID4N
Cj4+ID4gIGRyaXZlcnMvc2xpbWJ1cy9zdHJlYW0uYyB8IDggKysrKystLS0NCj4+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+PiA+DQo+PiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NsaW1idXMvc3RyZWFtLmMgYi9kcml2ZXJzL3NsaW1idXMvc3Ry
ZWFtLmMNCj4+ID4gaW5kZXggMWQ2YjM4NjU3OTE3Li44NjNhYjMwNzVkN2UgMTAwNjQ0DQo+PiA+
IC0tLSBhL2RyaXZlcnMvc2xpbWJ1cy9zdHJlYW0uYw0KPj4gPiArKysgYi9kcml2ZXJzL3NsaW1i
dXMvc3RyZWFtLmMNCj4+ID4gQEAgLTE4LDE1ICsxOCwxNyBAQA0KPj4gPiAgICogICAgICAgICAg
IGFuZCB0aGUgZmlyc3Qgc2xvdCBvZiB0aGUgbmV4dCAgY29uc2VjdXRpdmUgU2VnbWVudC4NCj4+
ID4gICAqIEBzZWdkaXN0X2NvZGU6IFNlZ21lbnQgRGlzdHJpYnV0aW9uIENvZGUgU0RbMTE6MF0N
Cj4+ID4gICAqIEBzZWdfb2Zmc2V0X21hc2s6IFNlZ21lbnQgb2Zmc2V0IG1hc2sgaW4gU0RbMTE6
MF0NCj4+ID4gLSAqIEBzZWdkaXN0X2NvZGVzOiBMaXN0IG9mIGFsbCBwb3NzaWJsZSBTZWdtZXQg
RGlzdHJpYnV0aW9uIGNvZGVzLg0KPj4gPiAgICovDQo+PiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0
IHNlZ2Rpc3RfY29kZSB7DQo+PiA+ICtzdHJ1Y3Qgc2VnZGlzdF9jb2RlIHsNCj4+ID4gICAgICAg
aW50IHJhdGVtOw0KPj4gPiAgICAgICBpbnQgc2VnX2ludGVydmFsOw0KPj4gPiAgICAgICBpbnQg
c2VnZGlzdF9jb2RlOw0KPj4gPiAgICAgICB1MzIgc2VnX29mZnNldF9tYXNrOw0KPj4gPg0KPj4g
PiAtfSBzZWdkaXN0X2NvZGVzW10gPSB7DQo+PiA+ICt9Ow0KPj4gPiArDQo+PiA+ICsvKiBzZWdk
aXN0X2NvZGVzIC0gTGlzdCBvZiBhbGwgcG9zc2libGUgU2VnbWVudCBEaXN0cmlidXRpb24gY29k
ZXMuICovDQo+PiAgICAgICBeIGlzbid0IGEgJ0AnIGNoYXJhY3RlciBtaXNzaW5nIGhlcmU/DQo+
Pg0KPj4gTWFrZSBzdXJlIHRvIHJlLWJ1aWxkIHRoZSBkb2NzIGFuZCBzZWUgd2hldGhlciBpdCBs
b29rcyBmaW5lLg0KPj4NCj4+IFRoYW5rcywNCj4+IC0gICAgICAgUmljYXJkby4NCj4+DQo+Pg0K
Pj4NCj4+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2VnZGlzdF9jb2RlIHNlZ2Rpc3RfY29kZXNb
XSA9IHsNCj4+ID4gICAgICAgezEsICAgICAxNTM2LCAgIDB4MjAwLCAgIDB4ZGZmfSwNCj4+ID4g
ICAgICAgezIsICAgICA3NjgsICAgIDB4MTAwLCAgIDB4Y2ZmfSwNCj4+ID4gICAgICAgezQsICAg
ICAzODQsICAgIDB4MDgwLCAgIDB4YzdmfSwNCj4+ID4gLS0NCj4+ID4gMi4yNS4xDQo+PiA+DQo+
PiA+DQo+Pg0KPg0K
