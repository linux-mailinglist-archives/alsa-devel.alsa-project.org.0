Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC66F505F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9387A13C0;
	Wed,  3 May 2023 08:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9387A13C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096777;
	bh=lFaZElAvgT4ehzXQ7t93Y90b3dRbEsQ8an+3qVamsGw=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IODhUaBwT+MISJgs7IwTvQkML78aqZ/RqLWQAJjNK821OlOlDJgxU+XHwBpxGQhVI
	 yEXgBC5wzZ+qMWVP97Qi91d97dI38SZuZ+KaS5GSpLQvQFfzfZWg2F5BEIum9hHjrS
	 FHxgrk04TzvMw/1UUWU5wn6AaMvls06WTg7u/hGU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 543BEF8053D;
	Wed,  3 May 2023 08:51:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEAF7F8049E; Mon,  1 May 2023 14:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C72BF80114
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 14:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C72BF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=g8nItwcH
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2a8bae45579so23030531fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682943763; x=1685535763;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jbWd5S9BikG1wPqugME+bXbNXYGwVFvvwPfUUs3p2E0=;
        b=g8nItwcH94jzCWAFPhGfolWZhQuZ/19pQiqpfm+5MmpxQgU7bQrjbAQBSgLD8nIJjG
         NlDr3sQVurlC71kcRG1W+tEKZtkd2tcTZZd8jjAepSmTntcGpFVXCSfMQPsaqfnBfP+d
         mISF0JeqFdzM9/C7dMp22SK0WdwUKHtMj6NJR0ztl/BygxtamtSY/5UQv+5uZuyrzusz
         B9r24vuX76n24nPTjZyArEZR8lcvknRAxGNCY+NnsgRov77+4rTnZRl4DWa6Ia0S+aQW
         FZByMlmhmpdKPZEeR+RoJyJUMK5xvCVKHDAngNUn6oMqdY9AbBzg1Qgp/AYY8jO5nEPs
         GHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943763; x=1685535763;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbWd5S9BikG1wPqugME+bXbNXYGwVFvvwPfUUs3p2E0=;
        b=HggPkuM3kF474xCWB0vOlA1M4ZOVIF0YYbF2qmc6GqKbQ5yyIQKA1YqfHEQu5tkGV4
         otHnh6SW1F36eZTj5MDUSG1oNoNTGBD7Oso347hPRJsxhfEwW0Lc7SU9z8i0PdnEKeOx
         NW3TH5mnilJQh6oHvwNJPGxQk7lbGwE5+K6St6bqbA0ZGodboDd/R8rix958KU9S7QHS
         KvAxCCcALiee1KREuk/W/lB8e3L/ezR1nAi+ETiCPHkii8ofgy8Cj73wquRJRJBoj5wA
         UURFvnsw4qO+LTqLL9VM48SG7lTp6kP5yqnbeK60IM9aEa0ItCr03phxC4qO8H6TX02h
         F6cw==
X-Gm-Message-State: AC+VfDxtZRYMp+uIzR/8EWaPVt2R/7v8DNmdCrHGsNtBHX3JAxts2Ghd
	9Z33ZwteymrBvXJK2RsHh/1YEAavpuqgttqHQGA=
X-Google-Smtp-Source: 
 ACHHUZ7SzFrJgnyTvpM/r9s0TmiI0gzI4HhLTtNWCILLGdW7y4pZoMqk9fIrrNEdr4PdUaZYnYaSGrN83A3cOtTFYM0=
X-Received: by 2002:a2e:9d0c:0:b0:2ab:19a0:667b with SMTP id
 t12-20020a2e9d0c000000b002ab19a0667bmr3676751lji.0.1682943763216; Mon, 01 May
 2023 05:22:43 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SXN0dsOhbiBWw6FyYWRp?= <varadiista.1@gmail.com>
Date: Mon, 1 May 2023 14:22:34 +0200
Message-ID: 
 <CACUCvsBu91Xx4qMOf8oiPod6-OMpnS6hp5MPbu52fFGSF9aSdA@mail.gmail.com>
Subject: [PATCH] ACP6x audio: Add board quirk for ASUSTeK COMPUTER INC.
 M3402RA
To: linux-kernel@vger.kernel.org
X-MailFrom: varadiista.1@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XWJCJA3XKN4HIIGDGYIG5WLPDFROUDIC
X-Message-ID-Hash: XWJCJA3XKN4HIIGDGYIG5WLPDFROUDIC
X-Mailman-Approved-At: Wed, 03 May 2023 06:51:16 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWJCJA3XKN4HIIGDGYIG5WLPDFROUDIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBMaW51eCBLZXJuZWwgRGV2ZWxvcGVycywNCg0KSSBob3BlIHRoaXMgZW1haWwgZmluZHMg
eW91IHdlbGwuIEkgYW0gd3JpdGluZyB0byBzdWJtaXQgYSBwYXRjaCBmb3IgdGhlDQpBQ1A2eCBh
dWRpbyBkcml2ZXIgaW4gdGhlIExpbnV4IGtlcm5lbCB0aGF0IGFkZHMgYSBib2FyZCBxdWlyayBm
b3IgdGhlDQpBU1VTVGVLIENPTVBVVEVSIElOQy4gTTM0MDJSQS4NCg0KQWZ0ZXIgZXhwZXJpZW5j
aW5nIGlzc3VlcyB3aXRoIHRoaXMgYm9hcmQgb24gbXkgTGludXggc3lzdGVtLCBJIHJlc2VhcmNo
ZWQNCnRoZSBpc3N1ZSBhbmQgZm91bmQgdGhhdCBhZGRpbmcgdGhlIGZvbGxvd2luZyBjb2RlIHNu
aXBwZXQgdG8gdGhlIGZpbGUNCnNvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jIHNob3VsZCBy
ZXNvbHZlIHRoZSBpc3N1ZToNCg0Kew0KICAgIC5kcml2ZXJfZGF0YSA9ICZhY3A2eF9jYXJkLA0K
ICAgIC5tYXRjaGVzID0gew0KICAgICAgICBETUlfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIkFT
VVNUZUsgQ09NUFVURVIgSU5DLiIpLA0KICAgICAgICBETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFN
RSwgIk0zNDAyUkEiKQ0KICAgIH0NCn0NCg0KQXMgc29tZW9uZSB3aXRoIG5vIGV4cGVyaWVuY2Ug
d2l0aCB0aGUgTGludXgga2VybmVsLCBJIGFtIHN1Ym1pdHRpbmcgdGhpcw0KcGF0Y2ggaW4gdGhl
IGhvcGVzIHRoYXQgaXQgd2lsbCBiZSBiZW5lZmljaWFsIHRvIGEgbGFyZ2VyIG51bWJlciBvZiB1
c2Vycy4NCkkgaGF2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCBvbiBteSBvd24gc3lzdGVtIGFuZCBjYW4g
Y29uZmlybSB0aGF0IGl0IHJlc29sdmVzDQp0aGUgaXNzdWUuDQoNClBsZWFzZSBsZXQgbWUga25v
dyBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIG9yIHJlcXVpcmUgYW55IGFkZGl0aW9uYWwNCmlu
Zm9ybWF0aW9uLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgaGFyZCB3b3JrIGFuZCBkZWRpY2F0aW9u
IHRvIGltcHJvdmluZyB0aGUgTGludXgga2VybmVsLg0KDQpCZXN0IHJlZ2FyZHMsDQpTdGV2ZSBW
w6FyYWRpDQo=
