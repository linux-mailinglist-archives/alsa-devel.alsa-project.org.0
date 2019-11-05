Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096DF000E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 15:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DC1916E2;
	Tue,  5 Nov 2019 15:39:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DC1916E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572964833;
	bh=GwzsQ761T6Uu8BMO08ClBR+zQa68nDV4LEwpQPoI7ek=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7OQsaK1VWs20CYl3Vm5XXJv01m8x41cDOnJ0xeUsPPGABYDukd8RSww8TaEj5mMs
	 hvZF7y9M+PAZicmqOK2C17TZCETF37/SA8wmJ4hPfbjVZxs1bJ15wux6vGF3LbJ8vA
	 E0G2ZuuDlrpAX3Wtn6eWT2ySsK3EHED3JCaHP7RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB95F80675;
	Tue,  5 Nov 2019 15:34:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3D1F8065E; Tue,  5 Nov 2019 15:34:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDFEAF80446
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDFEAF80446
IronPort-SDR: BWshZGUL+WC6s3yxPF+rC3AjcjPhIHL6e+nCDAZ2NJEBlVC7UfvEvuBb+h6ysTgqH9fR9PoTWV
 R86ngn+MVequ62PimCLBm+EZwJ4zIKMmatKjdewmpmhMfphZOhvCzpm6r3rhwmxdtbIpopL+Zl
 VIxZvV5sBy9/y3rregBRYleHrwYsA1edR048GRCOa60lRJ7M44KXXtr5PTB/KYNoIfufW1OvI7
 qfZ3PgU9wFtVe8tmcHteiF3yPHOSPhcYnGDq/6U9YvNGF7zhkSQ8BC637Po58op8sN85ZDf6LO
 tH8=
X-IronPort-AV: E=Sophos;i="5.68,271,1569312000"; d="scan'208";a="44730656"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 06:34:43 -0800
IronPort-SDR: tcZgpC/pYlyvFflaFhrt2xaVVmdwpIyGNC28cR40IEDaNgeZcNKj4qd+wXAHt/PY/xppI+5Nxw
 vqatF4DztGGuX0IlfQuPrMLozaOGpLfHAl72b2dV9Wv0nRNpV1eae8fhSg3ttgj5laxMSA8Ljl
 FLQAmHh+iKpVa/95j2Wlqr1jSjSaFcM0awnw+T25ylv2R0lpKZJ5S+b392vB2PL4qhYgSudsQM
 w3iZulI7vbYcoiFr1KgyiE2RvW1ePzfqJoqtEdOXUvuSJQ9b5E+ddh/+ltbWYqS63Jgd2+opnU
 DGc=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Tue, 5 Nov 2019 08:32:18 -0600
Message-ID: <20191105143218.5948-9-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105143218.5948-8-andrew_gabbasov@mentor.com>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>
 <20191105143218.5948-2-andrew_gabbasov@mentor.com>
 <20191105143218.5948-3-andrew_gabbasov@mentor.com>
 <20191105143218.5948-4-andrew_gabbasov@mentor.com>
 <20191105143218.5948-5-andrew_gabbasov@mentor.com>
 <20191105143218.5948-6-andrew_gabbasov@mentor.com>
 <20191105143218.5948-7-andrew_gabbasov@mentor.com>
 <20191105143218.5948-8-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v2 8/8] ALSA: aloop: Support runtime change of
	snd_timer via info interface
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Show and change sound card timer source with read-write info
file in proc filesystem. Initial string can still be set as
module parameter.

The timer source string value can be changed at any time,
but it is latched by PCM substream open callback (the first one
for a particular cable). At this point it is actually used, that
is the string is parsed, and the timer is looked up and opened.

The timer source is set for a loopback card (the same as initial
setting by module parameter), but every cable uses the value,
current at the moment of open.

Setting the value to empty string switches the timer to jiffies.

Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 6db70ebd46f6..16444a34d4b9 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1655,7 +1655,7 @@ static void print_cable_info(struct snd_info_entry *entry,
 	mutex_unlock(&loopback->cable_lock);
 }
 
-static int loopback_proc_new(struct loopback *loopback, int cidx)
+static int loopback_cable_proc_new(struct loopback *loopback, int cidx)
 {
 	char name[32];
 
@@ -1676,6 +1676,40 @@ static void loopback_set_timer_source(struct loopback *loopback,
 						      value, GFP_KERNEL);
 }
 
+static void print_timer_source_info(struct snd_info_entry *entry,
+				    struct snd_info_buffer *buffer)
+{
+	struct loopback *loopback = entry->private_data;
+
+	snd_iprintf(buffer, "%s\n",
+		    loopback->timer_source ? loopback->timer_source : "");
+}
+
+static void change_timer_source_info(struct snd_info_entry *entry,
+				     struct snd_info_buffer *buffer)
+{
+	struct loopback *loopback = entry->private_data;
+	char line[64];
+
+	if (!snd_info_get_line(buffer, line, sizeof(line)))
+		loopback_set_timer_source(loopback, strim(line));
+}
+
+static int loopback_timer_source_proc_new(struct loopback *loopback)
+{
+	struct snd_info_entry *entry;
+	int err;
+
+	err = snd_card_proc_new(loopback->card, "timer_source", &entry);
+	if (err < 0)
+		return err;
+
+	snd_info_set_text_ops(entry, loopback, print_timer_source_info);
+	entry->mode |= S_IWUSR;
+	entry->c.text.write = change_timer_source_info;
+	return 0;
+}
+
 static int loopback_probe(struct platform_device *devptr)
 {
 	struct snd_card *card;
@@ -1708,8 +1742,9 @@ static int loopback_probe(struct platform_device *devptr)
 	err = loopback_mixer_new(loopback, pcm_notify[dev] ? 1 : 0);
 	if (err < 0)
 		goto __nodev;
-	loopback_proc_new(loopback, 0);
-	loopback_proc_new(loopback, 1);
+	loopback_cable_proc_new(loopback, 0);
+	loopback_cable_proc_new(loopback, 1);
+	loopback_timer_source_proc_new(loopback);
 	strcpy(card->driver, "Loopback");
 	strcpy(card->shortname, "Loopback");
 	sprintf(card->longname, "Loopback %i", dev + 1);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
