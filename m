Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B832BFF5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 09:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F257417FC;
	Tue, 28 May 2019 09:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F257417FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559027836;
	bh=TNUK0GTznBcjx/J2LZo4mGbywd3HqPd2KL+Yv3upZug=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bt2FAks+hHpqr/VKDXNjkp14XFeU1DRYpth167HrZL3wrC2B2VNAZOAzdmaZWLtsn
	 YScWQYG8S6h8aFB4JUgx0VrIJOvHgQf7pIPrVQf3FkNvWsGGR+/Hnk6PioK/k4IPqp
	 Y0SwcDI08l5aOmjlmfsf5pkj7X7M+hR0BBXR25Y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA46F8973D;
	Tue, 28 May 2019 09:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1908AF89708; Tue, 28 May 2019 09:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18AE0F8970A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18AE0F8970A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53FC6AF21
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 07:12:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 28 May 2019 09:12:01 +0200
Message-Id: <20190528071201.27400-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528071201.27400-1-tiwai@suse.de>
References: <20190528071201.27400-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH v2 5/5] ALSA: line6: Use container_of()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

... instead of unconditional cast.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pod.c      | 12 +++++++-----
 sound/usb/line6/podhd.c    |  8 +++++---
 sound/usb/line6/toneport.c | 14 +++++++-------
 sound/usb/line6/variax.c   | 10 ++++++----
 4 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index 995e6ccc8122..9ea720b4b2ab 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -74,6 +74,8 @@ struct usb_line6_pod {
 	int device_id;
 };
 
+#define line6_to_pod(x)		container_of(x, struct usb_line6_pod, line6)
+
 #define POD_SYSEX_CODE 3
 
 /* *INDENT-OFF* */
@@ -177,7 +179,7 @@ static char *pod_alloc_sysex_buffer(struct usb_line6_pod *pod, int code,
 */
 static void line6_pod_process_message(struct usb_line6 *line6)
 {
-	struct usb_line6_pod *pod = (struct usb_line6_pod *) line6;
+	struct usb_line6_pod *pod = line6_to_pod(line6);
 	const unsigned char *buf = pod->line6.buffer_message;
 
 	if (memcmp(buf, pod_version_header, sizeof(pod_version_header)) == 0) {
@@ -274,7 +276,7 @@ static ssize_t device_id_show(struct device *dev,
 
 static void pod_startup(struct usb_line6 *line6)
 {
-	struct usb_line6_pod *pod = (struct usb_line6_pod *) line6;
+	struct usb_line6_pod *pod = line6_to_pod(line6);
 
 	switch (pod->startup_progress) {
 	case POD_STARTUP_VERSIONREQ:
@@ -328,7 +330,7 @@ static int snd_pod_control_monitor_get(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_line6_pcm *line6pcm = snd_kcontrol_chip(kcontrol);
-	struct usb_line6_pod *pod = (struct usb_line6_pod *)line6pcm->line6;
+	struct usb_line6_pod *pod = line6_to_pod(line6pcm->line6);
 
 	ucontrol->value.integer.value[0] = pod->monitor_level;
 	return 0;
@@ -339,7 +341,7 @@ static int snd_pod_control_monitor_put(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_line6_pcm *line6pcm = snd_kcontrol_chip(kcontrol);
-	struct usb_line6_pod *pod = (struct usb_line6_pod *)line6pcm->line6;
+	struct usb_line6_pod *pod = line6_to_pod(line6pcm->line6);
 
 	if (ucontrol->value.integer.value[0] == pod->monitor_level)
 		return 0;
@@ -368,7 +370,7 @@ static int pod_init(struct usb_line6 *line6,
 		    const struct usb_device_id *id)
 {
 	int err;
-	struct usb_line6_pod *pod = (struct usb_line6_pod *) line6;
+	struct usb_line6_pod *pod = line6_to_pod(line6);
 
 	line6->process_message = line6_pod_process_message;
 	line6->startup = pod_startup;
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index 722fc5db09c5..395ae1692f45 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -44,6 +44,8 @@ struct usb_line6_podhd {
 	int firmware_version;
 };
 
+#define line6_to_podhd(x)	container_of(x, struct usb_line6_podhd, line6)
+
 static struct snd_ratden podhd_ratden = {
 	.num_min = 48000,
 	.num_max = 48000,
@@ -231,7 +233,7 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 
 static void podhd_startup(struct usb_line6 *line6)
 {
-	struct usb_line6_podhd *pod = (struct usb_line6_podhd *)line6;
+	struct usb_line6_podhd *pod = line6_to_podhd(line6);
 
 	podhd_dev_start(pod);
 	line6_read_serial_number(&pod->line6, &pod->serial_number);
@@ -241,7 +243,7 @@ static void podhd_startup(struct usb_line6 *line6)
 
 static void podhd_disconnect(struct usb_line6 *line6)
 {
-	struct usb_line6_podhd *pod = (struct usb_line6_podhd *)line6;
+	struct usb_line6_podhd *pod = line6_to_podhd(line6);
 
 	if (pod->line6.properties->capabilities & LINE6_CAP_CONTROL_INFO) {
 		struct usb_interface *intf;
@@ -260,7 +262,7 @@ static int podhd_init(struct usb_line6 *line6,
 		      const struct usb_device_id *id)
 {
 	int err;
-	struct usb_line6_podhd *pod = (struct usb_line6_podhd *) line6;
+	struct usb_line6_podhd *pod = line6_to_podhd(line6);
 	struct usb_interface *intf;
 
 	line6->disconnect = podhd_disconnect;
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index 55865f7e437d..94a9764110d3 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -61,6 +61,8 @@ struct usb_line6_toneport {
 	struct toneport_led leds[2];
 };
 
+#define line6_to_toneport(x) container_of(x, struct usb_line6_toneport, line6)
+
 static int toneport_send_cmd(struct usb_device *usbdev, int cmd1, int cmd2);
 
 #define TONEPORT_PCM_DELAY 1
@@ -211,8 +213,8 @@ static int snd_toneport_source_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_line6_pcm *line6pcm = snd_kcontrol_chip(kcontrol);
-	struct usb_line6_toneport *toneport =
-	    (struct usb_line6_toneport *)line6pcm->line6;
+	struct usb_line6_toneport *toneport = line6_to_toneport(line6pcm->line6);
+
 	ucontrol->value.enumerated.item[0] = toneport->source;
 	return 0;
 }
@@ -222,8 +224,7 @@ static int snd_toneport_source_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_line6_pcm *line6pcm = snd_kcontrol_chip(kcontrol);
-	struct usb_line6_toneport *toneport =
-	    (struct usb_line6_toneport *)line6pcm->line6;
+	struct usb_line6_toneport *toneport = line6_to_toneport(line6pcm->line6);
 	unsigned int source;
 
 	source = ucontrol->value.enumerated.item[0];
@@ -397,8 +398,7 @@ static int toneport_setup(struct usb_line6_toneport *toneport)
 */
 static void line6_toneport_disconnect(struct usb_line6 *line6)
 {
-	struct usb_line6_toneport *toneport =
-		(struct usb_line6_toneport *)line6;
+	struct usb_line6_toneport *toneport = line6_to_toneport(line6);
 
 	if (toneport_has_led(toneport))
 		toneport_remove_leds(toneport);
@@ -412,7 +412,7 @@ static int toneport_init(struct usb_line6 *line6,
 			 const struct usb_device_id *id)
 {
 	int err;
-	struct usb_line6_toneport *toneport =  (struct usb_line6_toneport *) line6;
+	struct usb_line6_toneport *toneport = line6_to_toneport(line6);
 
 	toneport->type = id->driver_info;
 
diff --git a/sound/usb/line6/variax.c b/sound/usb/line6/variax.c
index fb114156b7ca..0d0de907d497 100644
--- a/sound/usb/line6/variax.c
+++ b/sound/usb/line6/variax.c
@@ -47,6 +47,8 @@ struct usb_line6_variax {
 	int startup_progress;
 };
 
+#define line6_to_variax(x)	container_of(x, struct usb_line6_variax, line6)
+
 #define VARIAX_OFFSET_ACTIVATE 7
 
 /*
@@ -86,7 +88,7 @@ static void variax_activate_async(struct usb_line6_variax *variax, int a)
 
 static void variax_startup(struct usb_line6 *line6)
 {
-	struct usb_line6_variax *variax = (struct usb_line6_variax *)line6;
+	struct usb_line6_variax *variax = line6_to_variax(line6);
 
 	switch (variax->startup_progress) {
 	case VARIAX_STARTUP_VERSIONREQ:
@@ -115,7 +117,7 @@ static void variax_startup(struct usb_line6 *line6)
 */
 static void line6_variax_process_message(struct usb_line6 *line6)
 {
-	struct usb_line6_variax *variax = (struct usb_line6_variax *) line6;
+	struct usb_line6_variax *variax = line6_to_variax(line6);
 	const unsigned char *buf = variax->line6.buffer_message;
 
 	switch (buf[0]) {
@@ -149,7 +151,7 @@ static void line6_variax_process_message(struct usb_line6 *line6)
 */
 static void line6_variax_disconnect(struct usb_line6 *line6)
 {
-	struct usb_line6_variax *variax = (struct usb_line6_variax *)line6;
+	struct usb_line6_variax *variax = line6_to_variax(line6);
 
 	kfree(variax->buffer_activate);
 }
@@ -160,7 +162,7 @@ static void line6_variax_disconnect(struct usb_line6 *line6)
 static int variax_init(struct usb_line6 *line6,
 		       const struct usb_device_id *id)
 {
-	struct usb_line6_variax *variax = (struct usb_line6_variax *) line6;
+	struct usb_line6_variax *variax = line6_to_variax(line6);
 	int err;
 
 	line6->process_message = line6_variax_process_message;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
