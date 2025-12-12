Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CE0CC6B72
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07AB60231;
	Wed, 17 Dec 2025 10:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07AB60231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962634;
	bh=WcIew6kzeXyxQAwNVyAWKZrs7nmEpFdwrxLCeSR6q5E=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gGZQzVonG+x7F9xhAr/eTuqgYbIySC6wjl3ubzFBuORzsAiWfnjTltvmg9TAuTX5L
	 rh1YKcW5YkJvwl/IxFb7INi1QLQoEnOsir7qbci64WJanw0mwBRAWcbpgSzDOwcTmL
	 Tx5k+vE5JylsV3u9DmMogtaJonKZtho7thOicPpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A54B2F805E2; Wed, 17 Dec 2025 10:10:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B8BAF805D7;
	Wed, 17 Dec 2025 10:10:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FB35F8014B; Fri, 12 Dec 2025 21:33:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8993CF80093
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 21:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8993CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Vlsm4tpY
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so299051666b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Dec 2025 12:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765571625; x=1766176425;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+AjDa10YJK9Zw+PRpk/+pGvNDcnlool8LjVYCZ20DXI=;
        b=Vlsm4tpYNFv0/AoVl7LYWK1Wj9WhUifRjDM3OaLYmju5i08acJ4WvHl1L+E37KjefP
         VfZJ553joyfxkUDAVQpKu4REtTk8QYZWFILsZ5HZwYP3pT027WQcFYmqgqLrs+y334zL
         EBlOPfBWwx1EyJ3LTFCrtWiH1gU+MCU2Dnvnqy4S5Roipnm5CGgTz9dQ6pQh8XqDiJO8
         3rSwySbQ8LtsuckPkghyoT9SkNPp7G6CtRtyDJVkXgyS1sHsTDXis+RkQTPv2yol4v0v
         whQ/roPLnS8L1nn+z4oB3g0JF9rozOfgCH8WOab/QKUQi14KaErWi1k6DFL1ORUEEbpI
         WS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765571625; x=1766176425;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+AjDa10YJK9Zw+PRpk/+pGvNDcnlool8LjVYCZ20DXI=;
        b=BAcyT435TMuiPhtGSlzD24rWDQmMxvmvafPP+UwyUcGDtLY1sgPzsVj03c2OjcIMBu
         0fK9FeTL8LururwcYEHJmXYQXTf9GHROB3j6SrcVNvKWVR6zYga0StwLbU0bMUiHiDhc
         CRySt2QX3+gZ3rfb5kduN2j+s7VO9N0HYjyNizKMjnEc4BYhZSsXAtri/LYx2h3Y7UVw
         SR2s+BWvMOodg3f/x/8yDgd62bGlvV9kD+DtoHSL7Q40HQL2dx/NJAwJxyj5q0pAmGXF
         3VLQdIaXKFaxbVaQAFOp2EgRx3wig9gR4SAoW0jajRYX1XM3fgc/whFjDawCCcsNP7x+
         yGCA==
X-Gm-Message-State: AOJu0YwS64zM9S/bnY/yu7FYLkeTFrmulT35uHC6SZYwzNSW1q6NnH26
	X/f2RXfEmurRL+iI5UG3aHYhNDGDNDQqiHjrKMGnyDyH9yRvLLxwABw7ak3VmpG/pTxWLMlCjWU
	moned6AxqFqsq7Y/a9k+oZf5UJo0tu6zBos0H
X-Gm-Gg: AY/fxX4dsxNnxtk4Am882d6II2vOCBs7r1NCbHMJ/mGzKkdshInvsuq4chsFvnbCObk
	qnMHaoBPCO826lv+jD+e4GplrWlsjKvArLMgK4EvojnxZFM92fPwhQs0CKa1o5XeE3jWtnZbIUl
	nF0LZyfZgDeGTZ+mE9lNP5bIbPKgAIfetlLeqvhGUvP5vbz5bQ58Wf9HD8jmmIBe6e15QaP7RhG
	mnJMTLcpoZw9IstbyR/l7+z++b6BF6/l+0/eIZlKUMN5I+/4lalEHOqCGygNiMc01oOai0PfC/a
	8bM=
X-Google-Smtp-Source: 
 AGHT+IF6cOHSMc/MyrGo5IQ6YxyBou5vr0siwf9UBq+iAGDoZpf3Xl7Hl/qea1dJG1rW1c7iT8ERO/XGeyx8ik6c3pE=
X-Received: by 2002:a17:907:6eac:b0:b76:f57f:a2c3 with SMTP id
 a640c23a62f3a-b7d236f781cmr374558166b.12.1765571625158; Fri, 12 Dec 2025
 12:33:45 -0800 (PST)
MIME-Version: 1.0
From: shahab ghodsi <shahab16774@gmail.com>
Date: Sat, 13 Dec 2025 00:03:34 +0330
X-Gm-Features: AQt7F2pQk79VR3UK5iuRu8BEHVNRXRiF6nBSuK0baocCcULSl7YWEvH835q_dzw
Message-ID: 
 <CAAoudtxWroZYjo0rJks72e-3ri36rEWEJo4CfPG0_sGf4E3zUQ@mail.gmail.com>
Subject: [BUG] Asus Expertbook B3402FV (1043:1e03) ALC256 - Headphone Low
 Vol/Noise & Internal Mic Broken
To: alsa-devel@alsa-project.org, linux-sound-intel@vger.kernel.org
X-MailFrom: shahab16774@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WG2IDAADWJUYKLBHZS4TXL3EMQQ4QSHU
X-Message-ID-Hash: WG2IDAADWJUYKLBHZS4TXL3EMQQ4QSHU
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:09:55 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WG2IDAADWJUYKLBHZS4TXL3EMQQ4QSHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBBTFNBIGFuZCBJbnRlbCBIRCBBdWRpbyBEZXZlbG9wZXJzLA0KDQpJIGFtIHJlcG9ydGlu
ZyBhbiBhdWRpbyBpc3N1ZSBhZmZlY3RpbmcgdGhlIGhlYWRwaG9uZSBvdXRwdXQgYW5kIGludGVy
bmFsDQptaWNyb3Bob25lIG9uIG15IG5ldyBBc3VzIEV4cGVydGJvb2sgQjM0MDJGViBydW5uaW5n
IEZlZG9yYSA0MyAoS2VybmVsDQo2LjE3LjkpLg0KDQoqSGFyZHdhcmUgU3VtbWFyeToqDQotIExh
cHRvcCBNb2RlbDogQXN1cyBFeHBlcnRib29rIEIzNDAyRlYNCi0gU3Vic3lzdGVtIElEOiAxMDQz
OjFlMDMNCi0gQ29udHJvbGxlcjogSW50ZWwgUmFwdG9yIExha2UtUC9VL0ggY0FWUyBbODA4Njo1
MWNhXQ0KLSBDb2RlYzogUmVhbHRlayBBTEMyNTYNCi0gS2VybmVsOiA2LjE3LjktMzAwLmZjNDMu
eDg2XzY0DQoNCipQcm9ibGVtIERldGFpbHM6Kg0KMS4gSGVhZHBob25lIE91dHB1dCAoMy41bW0g
SmFjayk6IFRoZSBvdXRwdXQgaXMgZXh0cmVtZWx5IGxvdyB2b2x1bWUgYW5kDQpoZWF2aWx5IGRp
c3RvcnRlZCB3aXRoIG5vaXNlLCBldmVuIGF0IDEwMCUuIE9ubHkgdGhlIGxvdWRlc3QgcGFydHMg
b2YgdGhlDQphdWRpbyB0cmFjayBhcmUgYXVkaWJsZS4gVGhpcyBzdHJvbmdseSBzdWdnZXN0cyB0
aGUgc2lnbmFsIGlzIGJ5cGFzc2luZyB0aGUNCmhlYWRwaG9uZSBhbXBsaWZpZXIuDQoyLiBIYW5k
cy1mcmVlICgzLjVtbSBqYWNrKSBtaWNyb3Bob25lOiBXT1JLUyBjb3JyZWN0bHkuDQozLiBJbnRl
cm5hbCBNaWNyb3Bob25lIChCdWlsdC1pbik6IFRoZSBpbnRlcm5hbCBtaWNyb3Bob25lIGRvZXMg
Tk9UIHdvcmsgYXQNCmFsbC4NCjMuIEludGVybmFsIFNwZWFrZXJzOiBXb3JrIGNvcnJlY3RseS4N
Cg0KKlRyb3VibGVzaG9vdGluZyBBdHRlbXB0ZWQgKEFsbCBmYWlsZWQgdG8gcmVzb2x2ZSB0aGUg
aXNzdWUpOioNCi0gRm9yY2luZyBsZWdhY3kgZHJpdmVyOiBgb3B0aW9ucyBzbmQtaW50ZWwtZHNw
Y2ZnIGRzcF9kcml2ZXI9MWANCi0gVHJ5aW5nIGtub3duIEFMQzI1NiBtb2RlbCBxdWlya3M6IGBt
b2RlbD1hbGMyNTYtYXN1cy1taWNgLA0KYG1vZGVsPWRlbGwtaGVhZHNldC1tdWx0aWAsIGBtb2Rl
bD1hbGMyNTYtYXN1cy1oZWFkc2V0IGZvcmNlX21vZGVsPTFgDQotIE1hbnVhbCBwaW4gcmV0YXNr
aW5nIHZpYSBgaGRhamFja3JldGFza2AuDQotIE1hbnVhbCBnYWluIGFkanVzdG1lbnRzIHVzaW5n
IGBoZGEtdmVyYmAuDQoNClRoZSBpc3N1ZSBhcHBlYXJzIHRvIGJlIGEgbWlzc2luZyBvciBpbmNv
cnJlY3QgaW5pdGlhbGl6YXRpb24gcXVpcmsgZm9yIHRoZQ0Kc3BlY2lmaWMgU3Vic3lzdGVtIElE
IDEwNDM6MWUwMyB0aGF0IGlzIHJlcXVpcmVkIHRvIGNvcnJlY3RseSBtYXAgdGhlIERBQw0KdG8g
dGhlIGhlYWRwaG9uZSBhbXBsaWZpZXIgYW5kIGVuYWJsZSB0aGUgaW50ZXJuYWwgbWljIGFycmF5
Lg0KDQpUaGUgZnVsbCBkaWFnbm9zdGljIHJlcG9ydCBpcyBhdmFpbGFibGUgaGVyZToNCmh0dHA6
Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTM4NDdmOTJiMzMwMjQwNTVhNGNlN2Q3OTAxNmFmZjE3
MTVmM2E0ZjkNCg0KVGhhbmsgeW91IGZvciB5b3VyIHRpbWUgYW5kIGFzc2lzdGFuY2UgaW4gbG9v
a2luZyBpbnRvIHRoaXMgc3BlY2lmaWMNCmhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uDQoNCkJlc3Qg
cmVnYXJkcywNCg0KU2hhaGFiIEdob2RzaQ0K
