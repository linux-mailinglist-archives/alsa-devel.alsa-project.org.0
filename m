Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B59B4CF31B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 09:01:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D071726;
	Mon,  7 Mar 2022 09:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D071726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646640110;
	bh=fB14sd0SMHUpnjMYTY97+ytSLsquYm7TWuMKbdQ9qlo=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gumzJQoCg/iSNFJ0S3Nz8CmwJLv3Kz2I8ZNA+mde76KsYvh3hcWjjF7XjUegenxgd
	 SE2dMWwS1NczDvBU0JvqnyhyTXyD/zNpLp43zHxl8eFJb4++ImzKELCR27opyeAWTc
	 u4opuDi3iF95WQuPepLrdJC4Gkao+haqXWauOKSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CCDF80431;
	Mon,  7 Mar 2022 09:00:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 200B8F8019D; Mon,  7 Mar 2022 03:24:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 824B0F8014C
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 03:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 824B0F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="RhZ6OeCf"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220307022416epoutp02b71c3103e1145cc8cec12a920acd7340~Z_AkjQbx71657116571epoutp02a
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 02:24:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220307022416epoutp02b71c3103e1145cc8cec12a920acd7340~Z_AkjQbx71657116571epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646619856;
 bh=G8q/Umh2vObZldto5+JDObwZYzuCpopDseh7c0F8fuo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=RhZ6OeCfAPnnjyEPqH7R156Toi7oTGLGxqJm4c+9nMLTBvAH0PgEFTurgNIEfjH9m
 B5uBYeXbf0bMF+BgWL6vusIuOjvgN52OVFOPU7hoqGPogODQg/YDDyiwg72cLptMMf
 RplKZxqUzuD4R7d3EOfC223vy24apE2FHHKNpB/c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220307022416epcas2p2c38b97b861c10aee392f0da26d24a651~Z_AkI1baZ0054200542epcas2p2t;
 Mon,  7 Mar 2022 02:24:16 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4KBj2M2V24z4x9Q2; Mon,  7 Mar
 2022 02:24:11 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 4D.6F.25540.83A65226; Mon,  7 Mar 2022 11:13:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20220307022409epcas2p4a2955a746c87d66564556e18ab94845f~Z_AdtxZd50597405974epcas2p4Q;
 Mon,  7 Mar 2022 02:24:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220307022409epsmtrp2ecf8955bf8d9cee6a2a8ba785d323a6c~Z_Adsy6O72162921629epsmtrp2R;
 Mon,  7 Mar 2022 02:24:09 +0000 (GMT)
X-AuditID: b6c32a47-81bff700000063c4-52-62256a38bcd1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.D2.29871.9CC65226; Mon,  7 Mar 2022 11:24:09 +0900 (KST)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.36.155.120]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220307022409epsmtip2836fbdc1baffef14253813093f509cc7~Z_Add9EU02591225912epsmtip2t;
 Mon,  7 Mar 2022 02:24:09 +0000 (GMT)
From: Oh Eomji <eomji.oh@samsung.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] sound: usb: Add vendor's hooking interface
Date: Mon,  7 Mar 2022 11:21:59 +0900
Message-Id: <1646619720-97113-1-git-send-email-eomji.oh@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOKsWRmVeSWpSXmKPExsWy7bCmua5FlmqSQcsTDosrFw8xWZxavpDJ
 onnxejaLuw9/sFhM+bWU2eLyrjlsFgf+LGaz6NzVz2qx4ftaRgdOjw2fm9g8ds66y+6xaVUn
 m8f+uWvYPfa9Xcbm0bdlFaPH+i1XWTw+b5IL4IjKtslITUxJLVJIzUvOT8nMS7dV8g6Od443
 NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBuk9JoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquU
 WpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ0xY+sl9oLjThV37yQ3MK4x62Lk5JAQMJE4
 cvUjexcjF4eQwA5GiePzz7BAOJ8YJfqfrmCFcL4xSjxsf84M0/JsxWUmiMReRol3n2cxQjg/
 GCVO3T/KDlLFJqAqMX3ZdqAEB4eIQJnEsumWIDXMAvcZJbrXXWIDqREWsJdouzwPbCoLUP3k
 letYQWxeAReJnguHWSC2yUncPNfJDNIsIXCJXeJ702I2iISLxPOl16FOEpZ4dXwLO4QtJfH5
 3V6ommKJgwueQ9k1Em8PtkLVGEvMetYOdhyzgKbE+l36IKaEgLLEkVtga5kF+CQ6Dv9lhwjz
 SnS0CUE0KklMaupkgrAlJFZ8boKyPST6z84Eu15IIFaie9cD1gmMsrMQ5i9gZFzFKJZaUJyb
 nlpsVGAMj6Pk/NxNjOAUp+W+g3HG2w96hxiZOBgPMUpwMCuJ8N4/r5IkxJuSWFmVWpQfX1Sa
 k1p8iNEUGFwTmaVEk/OBSTavJN7QxNLAxMzM0NzI1MBcSZzXK2VDopBAemJJanZqakFqEUwf
 EwenVAOT2d7NM1uznoWv/p9me3zJxvcr1/+Wck3bOvGF2BJTpy8R894HfdUQ2Pfh4dZwtnrr
 jChlHr4vz9ctS1fw2Wz8+Hb9JTauaUfLkvhjK2cdl7byummlpJDB6bRQ9O40h8UtkYZ6U7v/
 THvz+EJmxczOS7aZ0zsCi8XXPC+dFZdy2ofzhnuS+ROtf7tTG2rfLlH62DjtuFXkbbFZ2l87
 X3/tTlijrPbcd1rY5jTN/l/KU3zlt9gx8/YKJArsDZ/UckN2m0rZV//HlR47jmRrnTT6mZTL
 rrck6tr5Mxt1W19LeCrnzVv78EnC8fz8i/N15rJu5utdEPqE4ezLivQVNT1Oefki038uuaZ3
 leXferP7SizFGYmGWsxFxYkAcFetnPoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSvO7JHNUkg4l3JS2uXDzEZHFq+UIm
 i+bF69ks7j78wWIx5ddSZovLu+awWRz4s5jNonNXP6vFhu9rGR04PTZ8bmLz2DnrLrvHplWd
 bB77565h99j3dhmbR9+WVYwe67dcZfH4vEkugCOKyyYlNSezLLVI3y6BK2PG1kvsBcedKu7e
 SW5gXGPWxcjJISFgIvFsxWWmLkYuDiGB3YwSKx5vZ4NISEgs6HrNDGELS9xvOcIKUfSNUWLq
 4T4mkASbgKrE9GXbGUFsEYEKiVtftzODFDELPGWUWDjhBli3sIC9RNvleWA2C1DD5JXrWEFs
 XgEXiZ4Lh1kgNshJ3DzXyTyBkWcBI8MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzg
 wNPS3MG4fdUHvUOMTByMhxglOJiVRHjvn1dJEuJNSaysSi3Kjy8qzUktPsQozcGiJM57oetk
 vJBAemJJanZqakFqEUyWiYNTqoFpxk5VZYZdRXnHrE5+at+QdLFM/ljqThWtHhb29nLPFJlr
 2x5KCB34YuAR/bpgvoz9/9x5LFeWi1ZUR6q7bZ1R/FUsMt1M/HZ68aby2idSu4vmKMwVn7bd
 t172WcUGjZSTl3/+aDDc6MorqDSlZ14Y87oO387k5RaL3N+/nH5O+vH0p7eMxLzvT+e1F5k5
 LfmXp+ILzfIzaTaiE6U8xbnPTrNd3uO9K/VlyBrnuvnHzUUTzpdX39r8Mjvm7O9cC4akZQf2
 Hay8XnrFSle4dWmYv5zJo7fBF2W/HNgkWWqqzjUh+VCYDXfJtX8cz4zMnUN2y5zIELxcd5p7
 S23FZ/Xmi0KGc+/X53Q5urP0/VJiKc5INNRiLipOBADRWfFiqwIAAA==
X-CMS-MailID: 20220307022409epcas2p4a2955a746c87d66564556e18ab94845f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220307022409epcas2p4a2955a746c87d66564556e18ab94845f
References: <CGME20220307022409epcas2p4a2955a746c87d66564556e18ab94845f@epcas2p4.samsung.com>
X-Mailman-Approved-At: Mon, 07 Mar 2022 09:00:08 +0100
Cc: alsa-devel@alsa-project.org, JaeHun Jung <jh0801.jung@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Oh Eomji <eomji.oh@samsung.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In mobile, a co-processor can be used with USB audio to improve power
consumption.  To support this type of hardware, hooks need to be added
to the USB audio subsystem to be able to call into the hardware when
needed.

The main operation of the call-backs are:
  - Initialize the co-processor by transmitting data when initializing.
  - Change the co-processor setting value through the interface
    function.
  - Configure sampling rate
  - pcm open/close
  - other housekeeping

Known issues:
  - This only supports one set of callback hooks, meaning that this only
    works if there is one type of USB controller in the system.  This
    should be changed to be a per-host-controller interface instead of
    one global set of callbacks.

Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
Signed-off-by: Oh Eomji <eomji.oh@samsung.com>
---
 sound/usb/card.c     | 120 +++++++++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/card.h     |  21 +++++++++
 sound/usb/usbaudio.h |  46 ++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 3769622..ac81c5f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -117,6 +117,118 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
 static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
+static struct snd_usb_audio_vendor_ops *usb_vendor_ops;
+
+int snd_vendor_set_ops(struct snd_usb_audio_vendor_ops *ops)
+{
+	if ((!ops->connect) ||
+	    (!ops->disconnect) ||
+	    (!ops->set_interface) ||
+	    (!ops->set_rate) ||
+	    (!ops->set_pcm_buf) ||
+	    (!ops->set_pcm_intf) ||
+	    (!ops->set_pcm_connection) ||
+	    (!ops->set_pcm_binterval) ||
+	    (!ops->usb_add_ctls))
+		return -EINVAL;
+
+	usb_vendor_ops = ops;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_vendor_set_ops);
+
+struct snd_usb_audio_vendor_ops *snd_vendor_get_ops(void)
+{
+	return usb_vendor_ops;
+}
+
+static int snd_vendor_connect(struct usb_interface *intf)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->connect(intf);
+	return 0;
+}
+
+static void snd_vendor_disconnect(struct usb_interface *intf)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		ops->disconnect(intf);
+}
+
+int snd_vendor_set_interface(struct usb_device *udev,
+			     struct usb_host_interface *intf,
+			     int iface, int alt)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->set_interface(udev, intf, iface, alt);
+	return 0;
+}
+
+int snd_vendor_set_rate(struct usb_interface *intf, int iface, int rate,
+			int alt)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->set_rate(intf, iface, rate, alt);
+	return 0;
+}
+
+int snd_vendor_set_pcm_buf(struct usb_device *udev, int iface)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		ops->set_pcm_buf(udev, iface);
+	return 0;
+}
+
+int snd_vendor_set_pcm_intf(struct usb_interface *intf, int iface, int alt,
+			    int direction)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->set_pcm_intf(intf, iface, alt, direction);
+	return 0;
+}
+
+int snd_vendor_set_pcm_connection(struct usb_device *udev,
+				  enum snd_vendor_pcm_open_close onoff,
+				  int direction)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->set_pcm_connection(udev, onoff, direction);
+	return 0;
+}
+
+int snd_vendor_set_pcm_binterval(const struct audioformat *fp,
+				 const struct audioformat *found,
+				 int *cur_attr, int *attr)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->set_pcm_binterval(fp, found, cur_attr, attr);
+	return 0;
+}
+
+static int snd_vendor_usb_add_ctls(struct snd_usb_audio *chip)
+{
+	struct snd_usb_audio_vendor_ops *ops = snd_vendor_get_ops();
+
+	if (ops)
+		return ops->usb_add_ctls(chip);
+	return 0;
+}
 
 /*
  * disconnect streams
@@ -753,6 +865,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (err < 0)
 		return err;
 
+	err = snd_vendor_connect(intf);
+	if (err)
+		return err;
+
 	/*
 	 * found a config.  now register to ALSA
 	 */
@@ -820,6 +936,8 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
 		usb_disable_autosuspend(interface_to_usbdev(intf));
 
+	snd_vendor_usb_add_ctls(chip);
+
 	/*
 	 * For devices with more than one control interface, we assume the
 	 * first contains the audio controls. We might need a more specific
@@ -907,6 +1025,8 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 
 	card = chip->card;
 
+	snd_vendor_disconnect(intf);
+
 	mutex_lock(&register_mutex);
 	if (atomic_inc_return(&chip->shutdown) == 1) {
 		struct snd_usb_stream *as;
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 87f042d..2b686e4 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -204,4 +204,25 @@ struct snd_usb_stream {
 	struct list_head list;
 };
 
+struct snd_usb_substream *find_snd_usb_substream(unsigned int card_num,
+	unsigned int pcm_idx, unsigned int direction, struct snd_usb_audio
+	**uchip, void (*disconnect_cb)(struct snd_usb_audio *chip));
+
+int snd_vendor_set_ops(struct snd_usb_audio_vendor_ops *vendor_ops);
+struct snd_usb_audio_vendor_ops *snd_vendor_get_ops(void);
+int snd_vendor_set_interface(struct usb_device *udev,
+			     struct usb_host_interface *alts,
+			     int iface, int alt);
+int snd_vendor_set_rate(struct usb_interface *intf, int iface, int rate,
+			int alt);
+int snd_vendor_set_pcm_buf(struct usb_device *udev, int iface);
+int snd_vendor_set_pcm_intf(struct usb_interface *intf, int iface, int alt,
+			    int direction);
+int snd_vendor_set_pcm_connection(struct usb_device *udev,
+				  enum snd_vendor_pcm_open_close onoff,
+				  int direction);
+int snd_vendor_set_pcm_binterval(const struct audioformat *fp,
+				 const struct audioformat *found,
+				 int *cur_attr, int *attr);
+
 #endif /* __USBAUDIO_CARD_H */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 1678341..edcb5a3 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -184,4 +184,50 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_DSD_RAW		(1U << 15)
 #define QUIRK_FLAG_SET_IFACE_FIRST	(1U << 16)
 
+struct audioformat;
+
+enum snd_vendor_pcm_open_close {
+	SOUND_PCM_CLOSE = 0,
+	SOUND_PCM_OPEN,
+};
+
+/**
+ * struct snd_usb_audio_vendor_ops - function callbacks for USB audio accelerators
+ * @connect: called when a new interface is found
+ * @disconnect: called when an interface is removed
+ * @set_interface: called when an interface is initialized
+ * @set_rate: called when the rate is set
+ * @set_pcm_buf: called when the pcm buffer is set
+ * @set_pcm_intf: called when the pcm interface is set
+ * @set_pcm_connection: called when pcm is opened/closed
+ * @set_pcm_binterval: called when the pcm binterval is set
+ * @usb_add_ctls: called when USB controls are added
+ *
+ * Set of callbacks for some accelerated USB audio streaming hardware.
+ *
+ * TODO: make this USB host-controller specific, right now this only works for
+ * one USB controller in the system at a time, which is only realistic for
+ * self-contained systems like phones.
+ */
+struct snd_usb_audio_vendor_ops {
+	int (*connect)(struct usb_interface *intf);
+	void (*disconnect)(struct usb_interface *intf);
+
+	int (*set_interface)(struct usb_device *udev,
+			     struct usb_host_interface *alts,
+			     int iface, int alt);
+	int (*set_rate)(struct usb_interface *intf, int iface, int rate,
+			int alt);
+	int (*set_pcm_buf)(struct usb_device *udev, int iface);
+	int (*set_pcm_intf)(struct usb_interface *intf, int iface, int alt,
+			    int direction);
+	int (*set_pcm_connection)(struct usb_device *udev,
+				  enum snd_vendor_pcm_open_close onoff,
+				  int direction);
+	int (*set_pcm_binterval)(const struct audioformat *fp,
+				 const struct audioformat *found,
+				 int *cur_attr, int *attr);
+	int (*usb_add_ctls)(struct snd_usb_audio *chip);
+};
+
 #endif /* __USBAUDIO_H */
-- 
2.7.4

