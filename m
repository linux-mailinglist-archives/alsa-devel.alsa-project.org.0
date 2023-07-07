Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48BA74A90E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 04:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355413E7;
	Fri,  7 Jul 2023 04:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355413E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688697298;
	bh=YQxsHOi63w6CPnpq/s6SOQuK+52XtD+3lKjBXr6ROsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L4xy7SkrYeQL23qJift9V5T9VqEk5E97thFLYlivxYX+jfazYmlXADWBezcHfQHtE
	 pq80qb9ejWkFzXhp3G6zIVecmtkiDOBz1nD/cmJ0WYbShqjJ1ScvBBphS2o9e6nAWu
	 1+XcOhmqWGaKsgNk12MgfUr0yGhy+AniPbdg3Dpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9930F80153; Fri,  7 Jul 2023 04:34:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 437C2F80124;
	Fri,  7 Jul 2023 04:34:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93CC4F80125; Fri,  7 Jul 2023 04:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 122DCF80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 04:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122DCF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=TuMPFrT5
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a1ebb79579so1174815b6e.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688697183; x=1691289183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nikJ8XpdYUvSDt7ttorQO4rC+VRRXIsiG0Z76ZkKRA=;
        b=TuMPFrT5y2xhO9b1MIzdK2INGb537TFB3KKV9/U6E6ewV3FQ1O4kFpJlXXBIf5MqT1
         U2EOQBR4lsE5/zk1Z1YqYK4wHXnU7iSjRbe0bPO/RaZMLBKRY6tazRefwpKyyGMaOHkD
         jxTtRnT7qqf9raGGPDVkI1XiWyN/HXnLVPt1Q4Co+e/ZrKbjhj+IYL/DZ8G4tUfVud39
         d55CeMtWEH79doc4lccgiEJ49yEotnaFjSbTJADdUB9XZqcfPhzr9b+sbAnQcLsDeOxF
         U05O288Az5Gm6YH2LW/t6JyLloSPfhJasDCB3oJ5SQkOQdV8bTaNwDQlUPXwdSWSlf7z
         rBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688697183; x=1691289183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nikJ8XpdYUvSDt7ttorQO4rC+VRRXIsiG0Z76ZkKRA=;
        b=SL5HI3s6HNpNtVqBEnVOpNtAIfjSO8/aRo5a9hTrCI/gm9Eo3OBdLOTUmatnzxXFj/
         HW3N67Pdw32kT9onnSgcXbxWTxSMphB2Eo0EnSFPbbRGKa0wO9K0Az/1T9TTpdmGosfH
         SO8PJNgenaWMc6FsallTSaVbVObpeedTz3aMyLFGmMq7dF6YNOAo7FfUsgpCcntgoM+n
         QVLDEhQ7VTBe3z5ZjXumN+bYr2Bvdh0Mut3Z2eTe3N7Eld7hU1jFlol/9fpamDZvHNeK
         8Bb3XQAFBwOci+p3gasX3eMhZS7bIIDHF6BLnV+i4LNsRwBW40YJs/N97W/bRGyK5ttO
         4jLw==
X-Gm-Message-State: ABy/qLZcP1L6NHVhPc5rwBzmYHFeCO13BK5gAhM3UR7LDYNLV8K0QXOx
	GUy8jRk/RSeGU7cEm1xP+RF1mYHQEgazIP/lRzY=
X-Google-Smtp-Source: 
 APBJJlEdXfuBWFQ+XT/eaESFoxfN2dzmPomiBrJTLABLFNVqZ4cWA4+1WlA8folLOiHIepuE37qeUitHXMf5kP6vBck=
X-Received: by 2002:a05:6808:f87:b0:3a3:9df9:1928 with SMTP id
 o7-20020a0568080f8700b003a39df91928mr4283117oiw.17.1688697183557; Thu, 06 Jul
 2023 19:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230706221827.1938990-1-festevam@gmail.com>
In-Reply-To: <20230706221827.1938990-1-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 7 Jul 2023 10:32:51 +0800
Message-ID: 
 <CAA+D8ANhQt3X1bg+8YEmMxuZJS3hnSKFX4kT_2xALJdDL28iiw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN
 bit for master mode"
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, andreas@fatal.se,
	hans.soderlund@realbit.se, Fabio Estevam <festevam@denx.de>,
 stable@vger.kernel.org
Message-ID-Hash: OECJMM6UAREV6FRAYUY7EWU6D75X3YQI
X-Message-ID-Hash: OECJMM6UAREV6FRAYUY7EWU6D75X3YQI
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OECJMM6UAREV6FRAYUY7EWU6D75X3YQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gRnJpLCBKdWwgNywgMjAyMyBhdCA2OjE44oCvQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToNCg0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBkZW54
LmRlPg0KPg0KPiBUaGlzIHJldmVydHMgY29tbWl0IGZmODdkNjE5YWMxODA0NDRkYjI5N2YwNDM5
NjJhNWMzMjVkZWQ0N2IuDQo+DQo+IEFuZHJlYXMgcmVwb3J0cyB0aGF0IG9uIGFuIGkuTVg4TVAt
YmFzZWQgc3lzdGVtIHdoZXJlIE1DTEsgbmVlZHMgdG8gYmUNCj4gdXNlZCBhcyBhbiBpbnB1dCwg
dGhlIE1DTEsgcGluIGlzIGFjdHVhbGx5IGFuIG91dHB1dCwgZGVzcGl0ZSBub3QgaGF2aW5nDQo+
IHRoZSAnZnNsLHNhaS1tY2xrLWRpcmVjdGlvbi1vdXRwdXQnIHByb3BlcnR5IHByZXNlbnQgaW4g
dGhlIGRldmljZXRyZWUuDQo+DQo+IFRoaXMgaXMgY2F1c2VkIGJ5IGNvbW1pdCBmZjg3ZDYxOWFj
MTggKCJBU29DOiBmc2xfc2FpOiBFbmFibGUNCj4gTUNUTF9NQ0xLX0VOIGJpdCBmb3IgbWFzdGVy
IG1vZGUiKSB0aGF0IHNldHMgRlNMX1NBSV9NQ1RMX01DTEtfRU4NCj4gdW5jb25kaXRpb25hbGx5
IGZvciBpbXg4bW0vOG1uLzhtcC85MywgY2F1c2luZyB0aGUgTUNMSyB0byBhbHdheXMNCj4gYmUg
Y29uZmlndXJlZCBhcyBvdXRwdXQuDQo+DQo+IEZTTF9TQUlfTUNUTF9NQ0xLX0VOIGNvcnJlc3Bv
bmRzIHRvIHRoZSBNT0UgKE1DTEsgT3V0cHV0IEVuYWJsZSkgYml0DQo+IG9mIHJlZ2lzdGVyIE1D
UiBhbmQgdGhlIGRyaXZlcnMgc2V0cyBpdCB3aGVuIHRoZQ0KPiAnZnNsLHNhaS1tY2xrLWRpcmVj
dGlvbi1vdXRwdXQnIGRldmljZXRyZWUgcHJvcGVydHkgaXMgcHJlc2VudC4NCj4NCj4gUmV2ZXJ0
IHRoZSBjb21taXQgdG8gYWxsb3cgU0FJIHRvIHVzZSBNQ0xLIGFzIGlucHV0IGFzIHdlbGwuDQo+
DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IEZpeGVzOiBmZjg3ZDYxOWFjMTggKCJB
U29DOiBmc2xfc2FpOiBFbmFibGUgTUNUTF9NQ0xLX0VOIGJpdCBmb3IgbWFzdGVyDQo+IG1vZGUi
KQ0KPiBSZXBvcnRlZC1ieTogQW5kcmVhcyBIZW5yaWtzc29uIDxhbmRyZWFzQGZhdGFsLnNlPg0K
PiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBkZW54LmRlPg0KPg0KDQpB
Y2tlZC1ieTogU2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2FuZ0BnbWFpbC5jb20+DQoNCkJlc3Qg
cmVnYXJkcw0KV2FuZyBTaGVuZ2ppdQ0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2ZzbC9mc2xfc2Fp
LmMgfCA2IC0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYyBiL3NvdW5kL3NvYy9mc2wvZnNsX3Nh
aS5jDQo+IGluZGV4IDVlMDlmNjM0YzYxYi4uNTRiNGJmMzc0NGM2IDEwMDY0NA0KPiAtLS0gYS9z
b3VuZC9zb2MvZnNsL2ZzbF9zYWkuYw0KPiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYw0K
PiBAQCAtNTA3LDEyICs1MDcsNiBAQCBzdGF0aWMgaW50IGZzbF9zYWlfc2V0X2JjbGsoc3RydWN0
IHNuZF9zb2NfZGFpICpkYWksDQo+IGJvb2wgdHgsIHUzMiBmcmVxKQ0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNhdmVkaXYgLyAyIC0gMSk7DQo+ICAgICAgICAgfQ0KPg0K
PiAtICAgICAgIGlmIChzYWktPnNvY19kYXRhLT5tYXhfcmVnaXN0ZXIgPj0gRlNMX1NBSV9NQ1RM
KSB7DQo+IC0gICAgICAgICAgICAgICAvKiBTQUkgaXMgaW4gbWFzdGVyIG1vZGUgYXQgdGhpcyBw
b2ludCwgc28gZW5hYmxlIE1DTEsgKi8NCj4gLSAgICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVf
Yml0cyhzYWktPnJlZ21hcCwgRlNMX1NBSV9NQ1RMLA0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEZTTF9TQUlfTUNUTF9NQ0xLX0VOLA0KPiBGU0xfU0FJX01DVExfTUNMS19F
Tik7DQo+IC0gICAgICAgfQ0KPiAtDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+DQo+IC0t
DQo+IDIuMzQuMQ0KPg0KPg0K
