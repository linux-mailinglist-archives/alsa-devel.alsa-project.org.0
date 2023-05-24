Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93367125CE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00CA74C;
	Fri, 26 May 2023 13:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00CA74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101506;
	bh=yLzaJ3BZwmUfDHcCkUlzajM4xei2/G1Dqqs+yKtQYnw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gF6GuOYeV3r4ZfnYGqqZb8Zy0ee7q/49p6sOpQM/AxiCr0SlmClLMrCUIj8pIU8Pp
	 hUSV/Feh+Vx+PTkXuKVg4edzCpggzLeP7ReRXt+ZRgOkykXxM1TbGmfER6McbRi3N7
	 ww6wQ0dhgx2qNcmvjRckrt16lPmvZsLm3xjdcnps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E98EFF805C3; Fri, 26 May 2023 13:42:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFF4F805BF;
	Fri, 26 May 2023 13:42:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E431F80249; Wed, 24 May 2023 21:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from domac.alu.hr (domac.alu.unizg.hr [IPv6:2001:b68:2:2800::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4104F80007
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 21:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4104F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.a=rsa-sha256
 header.s=mail header.b=FwExTAdr;
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr
 header.a=rsa-sha256 header.s=mail header.b=u7TmgFJs
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id E38276019E;
	Wed, 24 May 2023 21:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1684955806; bh=yLzaJ3BZwmUfDHcCkUlzajM4xei2/G1Dqqs+yKtQYnw=;
	h=From:To:Cc:Subject:Date:From;
	b=FwExTAdritu5OMXZ1qimA82muaBvAAZZP9XBYSiUddU0pu0CSSAIeiku1fL1gF1y3
	 8EK/gCCmyEga+zgVCB2NfEgYdD64pQDj59fti+yQBcsDDYQLU8nQEglkyaQnbSzcUB
	 ALVYZpu9C7Vo6WTt+2w3JEtwox0IcKUhmk9HkARI4u7JB161oEorrGKgAw2kq+YNc5
	 O3Z8JwiY8ZQ7TAcxQk1ciBtRiUqn1Vjj2mcXeeW6ddyQk08RwQJRL/4jE1VgeD/aQB
	 6u9Cu0Np+gUO0Xt+ua81WcpoY3xdu0SqTmKbI3ekVyqYPYGZhPjaKPEi6UIOdHlEiz
	 WFePpPOkjoy4Q==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjDZ7k-lC9gp; Wed, 24 May 2023 21:16:44 +0200 (CEST)
Received: from defiant.. (unknown [77.237.113.62])
	by domac.alu.hr (Postfix) with ESMTPSA id 4223F601A1;
	Wed, 24 May 2023 21:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1684955804; bh=yLzaJ3BZwmUfDHcCkUlzajM4xei2/G1Dqqs+yKtQYnw=;
	h=From:To:Cc:Subject:Date:From;
	b=u7TmgFJs2EolMF9HnPBHEVBeNWJMWTMs5t+225/p8LX5Dt/IADJxHsgO4k6VH5Tn/
	 OS+4VGrPeIma2C3Mj+3T4iXihBQZBoH/HsXG4Y7pg0bx8NSzwxwGQorHiK3MrvyeyK
	 x+r6AxPcZ6ZbZh/ZgTBJdTradXznD0Rbrdy0rYsb3c0FdJpw5sRF9Hr38zx1E6FEYb
	 gryy52wn3nADaEkPq61+RoqBtc35H6bmGeGHejPcFnECNZOiMxLlcQx7F5C571z3zq
	 7N/RPnI1YMbTo4GzTs2pr83GpzeflkEcYideSpWU4lzhWwSHu/uMOvSpayLDEoLnfu
	 RXjxMeYZJMXzA==
From: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
To: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Subject: [PATCH v1 1/1] selftests: alsa: pcm-test: Fix compiler warnings about
 the format
Date: Wed, 24 May 2023 21:15:29 +0200
Message-Id: <20230524191528.13203-1-mirsad.todorovac@alu.unizg.hr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mirsad.todorovac@alu.unizg.hr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6OGF3KV7N567GMGPAPIEPINTUYBHL2G7
X-Message-ID-Hash: 6OGF3KV7N567GMGPAPIEPINTUYBHL2G7
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OGF3KV7N567GMGPAPIEPINTUYBHL2G7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

GCC 11.3.0 issues warnings in this module about wrong sizes of format
specifiers:

pcm-test.c: In function ‘test_pcm_time’:
pcm-test.c:384:68: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 5 \
				has type ‘unsigned int’ [-Wformat=]
  384 |                 snprintf(msg, sizeof(msg), "rate mismatch %ld != %ld", rate, rrate);
pcm-test.c:455:53: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has \
				type ‘long int’ [-Wformat=]
  455 |                                          "expected %d, wrote %li", rate, frames);
pcm-test.c:462:53: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has \
				type ‘long int’ [-Wformat=]
  462 |                                          "expected %d, wrote %li", rate, frames);
pcm-test.c:467:53: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has \
				type ‘long int’ [-Wformat=]
  467 |                                          "expected %d, wrote %li", rate, frames);

Simple fix according to compiler's suggestion removed the warnings.

Signed-off-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
---
 tools/testing/selftests/alsa/pcm-test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 3e390fe67eb9..b7eef32addb4 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -381,7 +381,7 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 		goto __close;
 	}
 	if (rrate != rate) {
-		snprintf(msg, sizeof(msg), "rate mismatch %ld != %ld", rate, rrate);
+		snprintf(msg, sizeof(msg), "rate mismatch %ld != %d", rate, rrate);
 		goto __close;
 	}
 	rperiod_size = period_size;
@@ -447,24 +447,24 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 			frames = snd_pcm_writei(handle, samples, rate);
 			if (frames < 0) {
 				snprintf(msg, sizeof(msg),
-					 "Write failed: expected %d, wrote %li", rate, frames);
+					 "Write failed: expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 			if (frames < rate) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 		} else {
 			frames = snd_pcm_readi(handle, samples, rate);
 			if (frames < 0) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 			if (frames < rate) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 		}
-- 
2.34.1

