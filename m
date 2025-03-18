Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95CA675B0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 14:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702D36036C;
	Tue, 18 Mar 2025 14:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702D36036C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742306273;
	bh=yI1agQ3B7Jpk6xuPHcDk76505PoNN2mGUJegXxzF4e4=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YbAt0iO+EXBeLSyIqN0a4vgrygRqMG4H28fKvl0i3Mrq7ku5PuWgOXylxyaxVoVm0
	 oF0M6jwt20CfT/nvpufMUZ18wYy/5UiKMEZ+jBP5Q5BquvhL92s52em6sRG2VokRT4
	 Rbxc4GyvdKeaAwliEdEQzCcVqzcPnB/VXQDJFkSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA59F805B5; Tue, 18 Mar 2025 14:57:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B7CF805B4;
	Tue, 18 Mar 2025 14:57:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A13F80587; Tue, 18 Mar 2025 14:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B64F802BE
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 14:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B64F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=blokas.io header.i=@blokas.io header.a=rsa-sha256
 header.s=google header.b=Q2R73xZC
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6f7031ea11cso60835917b3.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Mar 2025 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blokas.io; s=google; t=1742306233; x=1742911033;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DuYRAfrewkQZZt+uLlzrffGglOJoMcYMXwHh1X0lVNQ=;
        b=Q2R73xZCIKeUcW3O9doFApmSzmK60Om4bu0+LDuSagr/4tN9Cov0h6L7FV2kt1i1OV
         CbOjBk+HtX+w0i6l9Jq7L+AQtDBZ9I8ELkPDcTVtO8gZBEcpMmA7mJpEYOSWvSWGMg/3
         3ypusCT34vPxx4amvDLyx3DhEZcEpChOmHfvSZMwqe5VprI7RUfzy1ER6odgvmNTx4G2
         JxGaS4HNK626rLoPn6oJ1cDSLNaf9gqwU86BNst0t9wk37VJqVULaADE9obPB77OHdUx
         jbnAMpS3ONl+k0SY31ZY1/0smJeSa5xacC4FBzKR6FkTbyO0GtNdfaLYP2W4wRxLHQ4O
         +cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306233; x=1742911033;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DuYRAfrewkQZZt+uLlzrffGglOJoMcYMXwHh1X0lVNQ=;
        b=LkW8qTmqYILOm6PW7oX4MbtQiesBdvaVGnqnoohutzOrAGgH71S9fCHPauR4wgCsBi
         ifZTEgNQxqMhlHtzAuZ8cC0cnRCdmabCpy26evm5vuvSHFB/X/gAuTO5VueHT2D+mSRn
         BIzi2QyTCkyiaaUSiiOo0lh0rLzJqh1r3YydRmgEab2JIgdv2iz6ok2lTMqR59SlT7Ud
         nnwoRI+xiG/Dg5jR0GM9blCpkWWo9RZ24xamFLOGp3g19iyt+At7+ngd7U9G8WulT+Tx
         A9j4FLL1WZ5TVEf5wDrpoC0x4cxbw03cLBx3A8Di2mfZWXWGK3gAWVjM3SF2aeS4IOHk
         QV0w==
X-Gm-Message-State: AOJu0YyhT1poGs4j19oolTfOvV0Lfa1h+GdMR/gAZweCyMFLN9zmBg+u
	DdUFuadXsudMcQaVk25YEPhfxY7SwDeFUMwi8DQ0sJi22Th2i8739SdqSkgFccN2P9ici5rIqBj
	3S1wYXzPJyMC+ciK4/kIlT/1DqkEsPDDjxraKeSZO5Syx3cQTVTo=
X-Gm-Gg: ASbGncvPoKAGWECyZJel9t649A9sM04RtdICvIL/qmHA1eus6CLJnrILAHdcNkTK45V
	8H5avMcaKtWmpen89FmFMZpdq4L2JNgMbc/k8vpz6ILZyJi7RGUothT65aavE9EQ/uxd6Wp0Qm3
	nmrnHVxn2AYT3usUAiq3f6QjPt84aPXHqFQDvH
X-Google-Smtp-Source: 
 AGHT+IEdAOhuk0ZRBF0Irc02jGWI8MBqYJlCLDeqfctZekUuRbAP/jKg6tJaOniMH7q51pppfScRykiX+GA3wLtORlY=
X-Received: by 2002:a05:6902:2781:b0:e63:d36f:96c1 with SMTP id
 3f1490d57ef6-e63f64c196bmr22566486276.10.1742306232789; Tue, 18 Mar 2025
 06:57:12 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Giedrius_Trainavi=C4=8Dius?= <giedrius@blokas.io>
Date: Tue, 18 Mar 2025 15:57:01 +0200
X-Gm-Features: AQ5f1JpqfVJORgUSdCEuin9T9-AtG9oZuv5g2XrHBTwAMZl21DXjBxpKtZYfk2w
Message-ID: 
 <CAMONXLvYv-LJRkc=caYG5A5mb+CML2dJGCnxRhy9VXJed-KUjw@mail.gmail.com>
Subject: UCM2 Conditional cset in BootSequence
To: alsa-devel@alsa-project.org
Message-ID-Hash: EL7ZPEIUN2IQXYN6V2BJTPKUCG4AKR4V
X-Message-ID-Hash: EL7ZPEIUN2IQXYN6V2BJTPKUCG4AKR4V
X-MailFrom: giedrius@blokas.io
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EL7ZPEIUN2IQXYN6V2BJTPKUCG4AKR4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sDQoNCkknbSB3cml0aW5nIGEgVUNNMiAuY29uZiBmaWxlLCBkZXBlbmRpbmcgb24gRGV2
aWNlIFRyZWUgb3B0aW9ucywgc29tZQ0Ka2NvbnRyb2xzIG1heSBvciBtYXkgbm90IGV4aXN0IC0g
aG93IGRvIEkgaGFuZGxlIHRoaXMgaW4gdGhlIEJvb3RTZXF1ZW5jZSwNCnNvIGFsc2FjdGwgZG9l
cyBub3QgZXJyb3Igb3V0IGlmIHNvbWUgY29udHJvbHMgZG9uJ3QgZXhpc3Q/DQoNCkkga25vdyB0
aGVyZSdzIGEgcG9zc2libGUgSWYgY29uZGl0aW9uIHRvIGNoZWNrIGlmIGEgY29udHJvbCBleGlz
dHMsIGJ1dA0KaG93IGRvIEkgdXNlIHRoYXQgdG8gY29uZGl0aW9uYWxseSBhcHBlbmQgdG8gdGhl
IEJvb3RTZXF1ZW5jZT8NCg0KVGhhbmsgeW91IQ0KR2llZHJpdXMuDQo=
