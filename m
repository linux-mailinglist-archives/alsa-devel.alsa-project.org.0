Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07077A37F58
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931C86027F;
	Mon, 17 Feb 2025 11:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931C86027F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739786868;
	bh=Zf3bQsk1oZtSkB5wg/6HpgBSiOWQhNYVKhig4aas/iE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iNoy5ItJY3rJ4xcMh7IcDNk8Yx/pzrVZF6WrghkZKRrrGIJx9qJa9HHtnekfkOzAq
	 SnwtrCtWCRe3dsz55MxKw6b6Rvz9QjmxLHkdpVZ1P9lcmoLYe45JdSv9YhhbxJcWV1
	 22qN9YB6dsTyWpMvAv9N+CNOZ4/jrlzoxjLlf0nE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35973F805B3; Mon, 17 Feb 2025 11:07:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F572F805B6;
	Mon, 17 Feb 2025 11:07:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F326AF80254; Mon,  3 Feb 2025 19:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3A6AF800ED
	for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2025 19:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A6AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=dwE36QTf
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 89100120002
	for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2025 21:35:39 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 89100120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1738607739;
	bh=EyqhjrL0LXhXk5cJaJwZSjg0pYdg2nalrMv+Hb4oKwY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dwE36QTfPpJuLX2FcYbghBuw0qYd+xwTxxVQhWMAssPUsTa+ix6uWuvo/UCLS7VWk
	 o3mcT0eevyCcjG37+BDczhtpbm//j50LFlGFtY61xw08NaWETeDWyMx8BvaV/yz5Vv
	 iAoSWkENhErlql/puUIxRm8RqxDjJQtS2cAz9qjWbRffWZ4VHXmNjj4yr6Oo0eyv/d
	 IJmNK+U8K1Jp1XLgHtrZx4ucsoh77a8eS9R2M/qou4coWciZzkgdKzWKOx22aokezw
	 nuIWkjcZ3FxC2vDO2ROywcrQopuFvgoiT9soly9DLkS8ABp1ZAFeqnu0CNlYDR1sor
	 qp25OpMN3VhDQ==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru
 [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS
	for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2025 21:35:39 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: <alsa-devel@alsa-project.org>
CC: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	<kernel@salutedevices.com>
Subject: [PATCH alsa-utils] amixer: implement handling of TLV bytes kcontrols
Date: Mon, 3 Feb 2025 21:35:14 +0300
Message-ID: <20250203183514.2645694-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.224.8]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190758 [Feb 03 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50
 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to},
 sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1,
 {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch},
 {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2025/02/03 17:06:00 #27204197
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B6ORGXQOSN3ZZOFRTSRFV7YQJVCNZWTN
X-Message-ID-Hash: B6ORGXQOSN3ZZOFRTSRFV7YQJVCNZWTN
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:07:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6ORGXQOSN3ZZOFRTSRFV7YQJVCNZWTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SND_SOC_BYTES_EXT kcontrols are deprecated and SND_SOC_BYTES_TLV should
be used instead. However, there is no support of these kcontrols in
amixer.

This commit introduces a mechanism to show and write the content of
SND_SOC_BYTES_TLV-based kcontrols.

Example:

  $ amixer cset name="Test" 0x10,0x20,0x30,0x40,0x50,0x60,0x70,0x80,0x90,0xa0
  $ amixer cget name="Test"
  numid=42,iface=MIXER,name='Test'
    ; type=BYTES,access=-----RW-,values=10
    : values=0x10,0x20,0x30,0x40,0x50,0x60,0x70,0x80,0x90,0xa0

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 amixer/amixer.c | 180 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 141 insertions(+), 39 deletions(-)

diff --git a/amixer/amixer.c b/amixer/amixer.c
index 07e9819e5cdb..09f774fe2885 100644
--- a/amixer/amixer.c
+++ b/amixer/amixer.c
@@ -609,6 +609,8 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 {
 	int err;
 	unsigned int item, idx, count, *tlv;
+	uint8_t *tlv_bytes = NULL;
+	unsigned int tlv_bytes_count = 0;
 	snd_ctl_elem_type_t type;
 	snd_ctl_elem_id_t *id;
 	snd_ctl_elem_info_t *info;
@@ -628,6 +630,18 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 	}
 	count = snd_ctl_elem_info_get_count(info);
 	type = snd_ctl_elem_info_get_type(info);
+	if (type == SND_CTL_ELEM_TYPE_BYTES &&
+	    !snd_ctl_elem_info_is_readable(info) &&
+	    !snd_ctl_elem_info_is_writable(info)) {
+		if (count <= 2 * sizeof(unsigned int))
+			return -EINVAL;
+		tlv_bytes_count = count;
+		count -= 2 * sizeof(unsigned int);
+
+		tlv_bytes = malloc(tlv_bytes_count);
+		if (!tlv_bytes)
+			return -ENOMEM;
+	}
 	printf("%s; type=%s,access=%s,values=%u", space, control_type(info), control_access(info), count);
 	switch (type) {
 	case SND_CTL_ELEM_TYPE_INTEGER:
@@ -661,16 +675,30 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 		break;
 	}
 	if (level & LEVEL_BASIC) {
-		if (!snd_ctl_elem_info_is_readable(info))
+		if (snd_ctl_elem_info_is_readable(info)) {
+			err = snd_hctl_elem_read(elem, control);
+			if (err < 0) {
+				error("Control %s element read error: %s\n", card, snd_strerror(err));
+				return err;
+			}
+		} else if (tlv_bytes) {
+			err = snd_hctl_elem_tlv_read(elem, (void *)tlv_bytes, tlv_bytes_count);
+			if (err < 0) {
+				error("Control %s element TLV read error: %s\n", card, snd_strerror(err));
+				free(tlv_bytes);
+				return err;
+			}
+		} else
 			goto __skip_read;
-		if ((err = snd_hctl_elem_read(elem, control)) < 0) {
-			error("Control %s element read error: %s\n", card, snd_strerror(err));
-			return err;
-		}
+
 		printf("%s: values=", space);
 		for (idx = 0; idx < count; idx++) {
 			if (idx > 0)
 				printf(",");
+			if (tlv_bytes) {
+				printf("0x%02x", tlv_bytes[idx + 2 * sizeof(unsigned int)]);
+				continue;
+			}
 			switch (type) {
 			case SND_CTL_ELEM_TYPE_BOOLEAN:
 				printf("%s", snd_ctl_elem_value_get_boolean(control, idx) ? "on" : "off");
@@ -699,17 +727,11 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 			}
 		}
 		printf("\n");
+		if (tlv_bytes)
+			goto __skip_tlv;
 	      __skip_read:
 		if (!snd_ctl_elem_info_is_tlv_readable(info))
 			goto __skip_tlv;
-		/* skip ASoC ext bytes controls that may have huge binary TLV data */
-		if (type == SND_CTL_ELEM_TYPE_BYTES &&
-				!snd_ctl_elem_info_is_readable(info) &&
-				!snd_ctl_elem_info_is_writable(info)) {
-			printf("%s; ASoC TLV Byte control, skipping bytes dump\n", space);
-			goto __skip_tlv;
-		}
-
 		tlv = malloc(4096);
 		if ((err = snd_hctl_elem_tlv_read(elem, tlv, 4096)) < 0) {
 			error("Control %s element TLV read error: %s\n", card, snd_strerror(err));
@@ -720,6 +742,7 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 		free(tlv);
 	}
       __skip_tlv:
+	free(tlv_bytes);
 	return 0;
 }
 
@@ -1133,16 +1156,110 @@ static int parse_simple_id(const char *str, snd_mixer_selem_id_t *sid)
 	return 0;
 }
 
+static int parse_bytes(const char *str, void *ptr, unsigned int len)
+{
+	char *p;
+	unsigned long tmp;
+	unsigned int idx = 0;
+	unsigned char *data = ptr;
+
+	for (;;) {
+		if (!*str)
+			break;
+		if (idx == len)
+			return -EINVAL;
+
+		tmp = strtoul(str, &p, 0);
+		if (p - str < 1)
+			return -EINVAL;
+		if (*p == ',')
+			str = p + 1;
+		else if (*p == '\0')
+			str = p;
+		else
+			return -EINVAL;
+
+		if (tmp > 255)
+			return -EINVAL;
+
+		data[idx] = tmp;
+		idx++;
+	}
+
+	if (!idx)
+		return -EINVAL;
+
+	return idx;
+}
+
+static int cset_tlv(int argc, char *argv[], snd_ctl_t *handle,
+	snd_ctl_elem_info_t *info, snd_ctl_elem_id_t *id)
+{
+	int err;
+	unsigned int count;
+	unsigned int *tlv = NULL;
+
+	count = snd_ctl_elem_info_get_count(info);
+	if (count <= 2 * sizeof(unsigned int)) {
+		err = -EINVAL;
+		goto out;
+	}
+	tlv = malloc(count);
+	if (!tlv) {
+		err = -ENOMEM;
+		goto out;
+	}
+	err = parse_bytes(argv[1], tlv + 2,
+			  count - 2 * sizeof(unsigned int));
+	if (err < 0)
+		goto out;
+	tlv[0] = 0;
+	tlv[1] = err;
+
+	err = snd_ctl_elem_tlv_write(handle, id, tlv);
+
+out:
+	free(tlv);
+	return err;
+}
+
+static int cset_elem(int argc, char *argv[], snd_ctl_t *handle,
+	snd_ctl_elem_info_t *info, snd_ctl_elem_id_t *id)
+{
+	int err;
+	snd_ctl_elem_value_t *control;
+	snd_ctl_elem_value_alloca(&control);
+
+	snd_ctl_elem_value_set_id(control, id);
+	if ((err = snd_ctl_elem_read(handle, control)) < 0) {
+		if (!ignore_error)
+			error("Cannot read the given element from control %s\n", card);
+		return err;
+	}
+	err = snd_ctl_ascii_value_parse(handle, control, info, argv[1]);
+	if (err < 0) {
+		if (!ignore_error)
+			error("Control %s parse error: %s\n", card, snd_strerror(err));
+		return err;
+	}
+	if ((err = snd_ctl_elem_write(handle, control)) < 0) {
+		if (!ignore_error)
+			error("Control %s element write error: %s\n", card, snd_strerror(err));
+		return err;
+	}
+
+	return 0;
+}
+
 static int cset(int argc, char *argv[], int roflag, int keep_handle)
 {
 	int err;
 	static snd_ctl_t *handle = NULL;
 	snd_ctl_elem_info_t *info;
 	snd_ctl_elem_id_t *id;
-	snd_ctl_elem_value_t *control;
+	snd_ctl_elem_type_t type;
 	snd_ctl_elem_info_alloca(&info);
 	snd_ctl_elem_id_alloca(&id);
-	snd_ctl_elem_value_alloca(&control);
 
 	if (argc < 1) {
 		fprintf(stderr, "Specify a full control identifier: [[iface=<iface>,][name='name',][index=<index>,][device=<device>,][subdevice=<subdevice>]]|[numid=<numid>]\n");
@@ -1175,30 +1292,15 @@ static int cset(int argc, char *argv[], int roflag, int keep_handle)
 	}
 	snd_ctl_elem_info_get_id(info, id);     /* FIXME: Remove it when hctl find works ok !!! */
 	if (!roflag) {
-		snd_ctl_elem_value_set_id(control, id);
-		if ((err = snd_ctl_elem_read(handle, control)) < 0) {
-			if (ignore_error)
-				return 0;
-			error("Cannot read the given element from control %s\n", card);
-			if (! keep_handle) {
-				snd_ctl_close(handle);
-				handle = NULL;
-			}
-			return err;
-		}
-		err = snd_ctl_ascii_value_parse(handle, control, info, argv[1]);
-		if (err < 0) {
- 			if (!ignore_error)
-				error("Control %s parse error: %s\n", card, snd_strerror(err));
-			if (!keep_handle) {
-				snd_ctl_close(handle);
-				handle = NULL;
-			}
-			return ignore_error ? 0 : err;
-		}
-		if ((err = snd_ctl_elem_write(handle, control)) < 0) {
-			if (!ignore_error)
-				error("Control %s element write error: %s\n", card, snd_strerror(err));
+		type = snd_ctl_elem_info_get_type(info);
+		if (type == SND_CTL_ELEM_TYPE_BYTES &&
+		    !snd_ctl_elem_info_is_readable(info) &&
+		    !snd_ctl_elem_info_is_writable(info)) {
+			err = cset_tlv(argc, argv, handle, info, id);
+		} else
+			err = cset_elem(argc, argv, handle, info, id);
+
+		if (err) {
 			if (!keep_handle) {
 				snd_ctl_close(handle);
 				handle = NULL;
-- 
2.34.1

