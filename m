Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA574333F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 05:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0963D74C;
	Fri, 30 Jun 2023 05:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0963D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688096329;
	bh=zQTswUkXt3RepkcAZKQsMb52LEqbpCBeLXEJsh6R+cM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvF9SPJKbtlDjvcicesdVWx+AGNFsipYFVc+39EBgGQ8Ye8L4XVhsRLtDXzBpaczZ
	 iRJhzrzIM9UZpjZqhA0m2g+ArZLzeYbO/ufT+ZFU3lciLITpGUQ9EOpNR/EMJHZCk1
	 XH/l+ROtZ3SDh3+moKmZ9mcDQJTssVU1ZIeKdb2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 371A1F80431; Fri, 30 Jun 2023 05:37:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD32F80212;
	Fri, 30 Jun 2023 05:37:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 562CFF80246; Fri, 30 Jun 2023 05:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9B22F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 05:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B22F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lcyzPq8l
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-763a2e39b88so134818885a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 20:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688096261; x=1690688261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2vp1WxV1X+3awcRK1E83g4O6ghnsdCU3yjKhzsqaIy0=;
        b=lcyzPq8lp+jqVbaPf4j8c8FU5pBGUEOMDJioeI4gELM3ZtIbCRwJzvpR1UO3RweVM7
         9VIvZegZj5tZtroj+FBgnlCPcOBsscGgA8ZdOBq+WWqkh9e/A3JRO0FLC7EsTxlM7YTM
         D8PCh2dCfZdmyRCBYw+6bl8m+jR2HeKbXlXpdXPZ3uLWTpks/8XENOCg5vFiGI92Cz2t
         TVfT9nfh2o7JnLidkZO2GGHUUtP93dl0ohlIlOp4pA+cD8m2hJjIc3qI1io2XQlutLqD
         1UFPlShSiO4A56YFXzcS9IRO0c7XJ5jkrfvoQjv9jXLOzVV1UwYtbQV89LJHZ0NgOYwW
         QFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688096261; x=1690688261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vp1WxV1X+3awcRK1E83g4O6ghnsdCU3yjKhzsqaIy0=;
        b=hzy3sA8isldv+KvLfgcV2ISttlQnjNyYfkpPApFQYA55nv/O8pC8XPEAuMxpiG/TvQ
         ZxFKOMnkvaphzsaRLe++W8holWqAeiFB7lHTG6GQuYh9k5xJaWKDIGKTU3rmJDNbLeKj
         WxN3EIcJ0vBYf2LlLsY/X7Mj5YUVsh52LsyZOUnMHZTMpgANvG04qbDh/4B1tuIGYLNP
         MRd1Q03xXwFrXXD0kZXHTxzp9cHagPXcMDgc5Lgm6Le3rLebP55DmMjvSeXY6pgS5ZrR
         542VPQ3jSY3RT2szIX3fxaF6sxaQCHvP1WUJP9Jhrd6WRh/BFl9NNRTre3bdTL53jQlE
         oAXQ==
X-Gm-Message-State: ABy/qLahpEm1JL+1ASCNvEW8L9SkjFvv6rojEJr3A9/IXpmVsTbWQXAJ
	lE5yiCgVWPmFIbVLONM9cr5iI3df7TuZqzywpH4=
X-Google-Smtp-Source: 
 APBJJlFT8Jj143WWzJfRmgE75w9CVGXnb+cPsWTuEXJIzGZgDnRszVIt2ay4Hq6w9HuFogT4UgL9dU21voR3z25NXt8=
X-Received: by 2002:a05:620a:ccb:b0:765:7c13:134f with SMTP id
 b11-20020a05620a0ccb00b007657c13134fmr976720qkj.69.1688096260599; Thu, 29 Jun
 2023 20:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com>
 <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
In-Reply-To: <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jun 2023 11:37:29 +0800
Message-ID: 
 <CAA+D8ANbMYr9ATSfWnbq69ECHOPNTiOBc7QACEeHomCC+rTHng@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: fsl_asrc: Add memory to memory driver
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, tfiga@chromium.org,
 m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Message-ID-Hash: KUZEEHPLSQZM2M2CGDTVZ6WQU3VFG7KQ
X-Message-ID-Hash: KUZEEHPLSQZM2M2CGDTVZ6WQU3VFG7KQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUZEEHPLSQZM2M2CGDTVZ6WQU3VFG7KQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgNzozOeKAr1BNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6DQoNCj4gT24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMDk6Mzc6NTFBTSAr
MDgwMCwgU2hlbmdqaXUgV2FuZyB3cm90ZToNCj4gPiBJbXBsZW1lbnQgdGhlIEFTUkMgbWVtb3J5
IHRvIG1lbW9yeSBmdW5jdGlvbiB1c2luZw0KPiA+IHRoZSB2NGwyIGZyYW1ld29yaywgdXNlciBj
YW4gdXNlIHRoaXMgZnVuY3Rpb24gd2l0aA0KPiA+IHY0bDIgaW9jdGwgaW50ZXJmYWNlLg0KPiA+
DQo+ID4gVXNlciBzZW5kIHRoZSBvdXRwdXQgYW5kIGNhcHR1cmUgYnVmZmVyIHRvIGRyaXZlciBh
bmQNCj4gPiBkcml2ZXIgc3RvcmUgdGhlIGNvbnZlcnRlZCBkYXRhIHRvIHRoZSBjYXB0dXJlIGJ1
ZmZlci4NCj4gPg0KPiA+IFRoaXMgZmVhdHVyZSBjYW4gYmUgc2hhcmVkIGJ5IEFTUkMgYW5kIEVB
U1JDIGRyaXZlcnMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZW5naml1IFdhbmcgPHNoZW5n
aml1LndhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgc291bmQvc29jL2ZzbC9LY29uZmlnICAg
ICAgICB8ICAxMyArDQo+ID4gIHNvdW5kL3NvYy9mc2wvTWFrZWZpbGUgICAgICAgfCAgIDIgKw0K
PiA+ICBzb3VuZC9zb2MvZnNsL2ZzbF9hc3JjX20ybS5jIHwgODc4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIHNvdW5kL3NvYy9mc2wvZnNsX2FzcmNfbTJtLmggfCAg
NDggKysNCj4NCj4gVGhpcyBmZWVscyBsaWtlIHRoZSBiaXQgd2hlcmUgd2UgaW50ZXJmYWNlIHY0
bCB0byBBU29DIHNob3VsZCBiZSBhDQo+IHNlcGFyYXRlIGxpYnJhcnksIHRoZXJlIHNob3VsZG4n
dCBiZSBhbnl0aGluZyBkZXZpY2Ugc3BlY2lmaWMgYWJvdXQNCj4gZ2V0dGluZyBhbiBhdWRpbyBz
dHJlYW0gaW50byBhIGJsb2NrIG9mIG1lbW9yeS4gIEknbSB0aGlua2luZyBzb21ldGhpbmcNCj4g
bGlrZSB0aGUgd2F5IHdlIGhhbmRsZSBkbWFlbmdpbmUgaGVyZS4NCj4NCj4gSSd2ZSBub3QgZHVn
IGludG8gdGhlIGNvZGUgeWV0IHRob3VnaC4NCj4NCg0KVXNlcnMgbWF5IHdhbnQgdG8gZ2V0IHRo
ZSBBU1JDIG91dHB1dCBpbiB0aGUgdXNlciBzcGFjZSwgdGhlbg0KZG8gbWl4aW5nIHdpdGggb3Ro
ZXIgc3RyZWFtcyBiZWZvcmUgc2VuZGluZyB0byBBTFNBLg0KDQpBcyB0aGVyZSBpcyBubyBzdWNo
IEFQSSBpbiBBU29DLCAgdGhlIGJlc3QgaW50ZXJmYWNlIEkgZm91bmQgaXMNCnRoZSBWNEwyLCBi
dXQgSSBuZWVkIHRvIGRvIGEgbGl0dGxlIG1vZGlmaWNhdGlvbiBvZiB0aGUgVjRMMiBBUEksDQoN
CmV4dGVuZCBpdCBmb3IgYXVkaW8gdXNhZ2UuDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc3VnZ2VzdCBt
b3JlIGFib3V0IHRoZSAic2VwYXJhdGUgbGlicmFyeSI/DQpTaG91bGQgSSBwbGFjZSB0aGlzICJz
b3VuZC9zb2MvZnNsL2ZzbF9hc3JjX20ybS5jIiBpbiBhbm90aGVyIGZvbGRlcj8NCg0KYmVzdCBy
ZWdhcmRzDQp3YW5nIHNoZW5naml1DQo=
