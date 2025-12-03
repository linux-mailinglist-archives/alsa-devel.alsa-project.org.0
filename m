Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 718F3C9E170
	for <lists+alsa-devel@lfdr.de>; Wed, 03 Dec 2025 08:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7310601B3;
	Wed,  3 Dec 2025 08:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7310601B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764748230;
	bh=45nB/VtrMnTs9gqPYuHhkWwgQ6Hb2niaCMMdc/G5GcQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sirTOyq0e3bYPBl709eWTthI+bEV0eF3YCIgFiqts9iA+cfzaDaUzKxyRNga+6dsb
	 IAF4wVX5axeGnAakJc+ix1gAOMlEaYa3xrlQc6NDmERRF0QlP3M7JUa3jtxjAtQORu
	 Bc2ikfQgg+3YMkLksWB8SZHiCTaIG1++X16OJEkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51643F8051D; Wed,  3 Dec 2025 08:49:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 136CEF805BF;
	Wed,  3 Dec 2025 08:49:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D571AF8051D; Wed,  3 Dec 2025 08:49:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 403D5F80269
	for <alsa-devel@alsa-project.org>; Wed,  3 Dec 2025 08:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403D5F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TE/a0VH/
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-3e8317b1262so7094942fac.3
        for <alsa-devel@alsa-project.org>;
 Tue, 02 Dec 2025 23:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764748187; x=1765352987;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKXOhQhqbZr57auUOCOEGt3Y1vL6G6LnYd6Jv1DpYK8=;
        b=TE/a0VH/EAjQ/diwlzBZLn7DdocoSPUhqy1HjpbfxFkTVBcBYuowTnhyOegkino/KT
         LP2PbRKCF2aFOydtSZStKr/j6ET8MKTN9pJkOoiaKCgqGsUBYViYl9XeMuPsQ5gbst+N
         hl3rIf3Tx68gGzJe4tT7cDO+Qf8IwqWn9ge6VfM/9OP+m9OqDgk7++3bcX5EtR2u9UZ5
         ivLf9g7qI2UeK7jWNyYiNHmxnsx42ouRvxMqVe6DGOLCH66CF+vmg53agqfo2kPuLxsr
         OLCKbfAWdL0BHy80Q/xWMeJTblPqlX9SHcwWwPNvVWDwaRJmyQrB+9yU+lNak04nE8Qa
         MMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764748187; x=1765352987;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKXOhQhqbZr57auUOCOEGt3Y1vL6G6LnYd6Jv1DpYK8=;
        b=MEfNNb0PPGjg2taMx7OoOfqno4mF4ft2yPQtkCLay5sj6JHbD6BSvOp8uoMZyCOCdN
         uqcQcokkQMazrfw8kXFAiLW4yL/n+hZGRS6yP2t5PrLAQ0plGP7mqY5D+NQS59K8j+En
         xzh6VVMiRec4tSnrLAvZoTCIHdqjxPU/PdJyqviOvFNVmv7Fmh4xk5H4j1nEVIo/YYfy
         6kdSo2exmOuq75bjN2LxXju+zobM7dSIRrVG9RgM99FWE46FYH4zjdSU9iMLCPfuvsRs
         mwEOtGEwx/y7iJ5jzuZ+p3usZMm7Rw5qkVb7nj7VpLI8epz9is0tzScTG6N0ukQRbYQ8
         ecnA==
X-Gm-Message-State: AOJu0YySqa9IkawgeKpuBFSN+V91qZExSXvJm+jQ89nRm02cJtu30TgR
	QQ4jIq1WeTF5vnJ1N9z/Uo/xgiQKA8IGt2mV+VY8Ull1ugCQmBwvjGWeQaB/k80LgUQcMnM3N4V
	0ddDazbkwSgFle2AIaX8VgP1i9fh74yw=
X-Gm-Gg: ASbGncs3pWcRjxNzPNhJO1QbDS+iwrkDL+5NMCQDDQGyn7F12qmf6dhuo/S7cxKms0T
	qw/cRBEjCnmEO2FdUKkiGzvIcpg/0T/R1wgsQTGbx5Lktu5oAQgfBCBiFCicN05s1hoo2usp8Qy
	VBh2clqVTZJaBu9OO6jbVzM1eqs9HTbJNwFDu5xMuuTXAZgwJCYwsnIjcErt1vRevgdEmLdZ+l6
	R5LorhLqT8IgxSRAP3/RNFExMMME7OugS2099AyJD6TU/uBBgDZnbEHDkQEwPzC5hov70A=
X-Google-Smtp-Source: 
 AGHT+IHmRoH03wuNGHK42SrKOVwAFek6HvwrVDWNdPFkZTbupxPUCusJRXx30gzpkiT/MEjy96is/4HoxOEK3s+bHww=
X-Received: by 2002:a05:6808:2184:b0:44d:a6a8:1b5f with SMTP id
 5614622812f47-4536e40d711mr712394b6e.24.1764748187127; Tue, 02 Dec 2025
 23:49:47 -0800 (PST)
MIME-Version: 1.0
From: Andres Rosa <andyrosa@gmail.com>
Date: Wed, 3 Dec 2025 01:49:12 -0600
X-Gm-Features: AWmQ_bnNcR5HFWgyATPMZHi0ekR37fXVSHe0JENlDXofVE7k1QUwil2AcXqUAk8
Message-ID: 
 <CAPDTTkh5YgiugcGN2-WS3d02UmvgknV7U9B9tsUo64qVhDJuTA@mail.gmail.com>
Subject: [PATCH] ALSA: uapi: Fix typo in
 [asound.h](http://_vscodecontentref_/0)
 comment
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Message-ID-Hash: XYC5IZEHIVJ7MMAGMXZMNZPWSPIRAZ3V
X-Message-ID-Hash: XYC5IZEHIVJ7MMAGMXZMNZPWSPIRAZ3V
X-MailFrom: andyrosa@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYC5IZEHIVJ7MMAGMXZMNZPWSPIRAZ3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rml4ICdsZXZlbC1zaGl0JyB0byAnbGV2ZWwtc2hpZnQnIGluIHN0cnVjdCBzbmRfY2VhXzg2MV9h
dWRfaWYgY29tbWVudC4NCg0KU2lnbmVkLW9mZi1ieTogQW5keSBSb3NhIDxhbmR5cm9zYUBnbWFp
bC5jb20+DQotLS0NCiBpbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmggfCAyICstDQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmggYi9pbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmgN
CmluZGV4IDVhMDQ5ZWVhZS4uZDNjZTc1YmE5IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS91YXBpL3Nv
dW5kL2Fzb3VuZC5oDQorKysgYi9pbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmgNCkBAIC02MCw3
ICs2MCw3IEBAIHN0cnVjdCBzbmRfY2VhXzg2MV9hdWRfaWYgew0KICAgICAgICB1bnNpZ25lZCBj
aGFyIGRiMl9zZl9zczsgLyogc2FtcGxlIGZyZXF1ZW5jeSBhbmQgc2l6ZSAqLw0KICAgICAgICB1
bnNpZ25lZCBjaGFyIGRiMzsgLyogbm90IHVzZWQsIGFsbCB6ZXJvcyAqLw0KICAgICAgICB1bnNp
Z25lZCBjaGFyIGRiNF9jYTsgLyogY2hhbm5lbCBhbGxvY2F0aW9uIGNvZGUgKi8NCi0gICAgICAg
dW5zaWduZWQgY2hhciBkYjVfZG1pbmhfbHN2OyAvKiBkb3dubWl4IGluaGliaXQgJiBsZXZlbC1z
aGl0IHZhbHVlcw0KKi8NCisgICAgICAgdW5zaWduZWQgY2hhciBkYjVfZG1pbmhfbHN2OyAvKiBk
b3dubWl4IGluaGliaXQgJiBsZXZlbC1zaGlmdA0KdmFsdWVzICovDQogfTsNCg0KIC8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqDQotLSANCjIuNTIuMC53aW5kb3dzLjENCg==
