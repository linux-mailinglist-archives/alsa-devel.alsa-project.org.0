Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C5852542
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 02:09:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 208621060;
	Tue, 13 Feb 2024 02:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 208621060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707786596;
	bh=tpV2LIvDWyMeK3jFmTnMWqmNOSZ53kTz7F2yP15ipF4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IdHCDEMlQP+LyQVCpLMSHRZ7cybydqvcsXw8QFKR65Wae5xh6zP8eLqpQSB0xIbDL
	 pPMxyjty0lgCwlYAEa8mkdUu48wEDUhlCuJ0ZePfhDI5tuNw+9XgqfJk2nHseArHhX
	 lRwVMfnFCrOtz1M6JwvC68rw4Dwrzt0ppmDNkA54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAD0AF80774; Tue, 13 Feb 2024 01:58:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25FAFF89A1E;
	Tue, 13 Feb 2024 01:58:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EA26F8980C; Tue, 13 Feb 2024 01:56:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D9AAF805C2
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D9AAF805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=D7vPyh+f
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D0RdKD002655;
	Tue, 13 Feb 2024 00:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=jIhNcJAao4L3t+lM7xoz
	Ms6yOtfapDmOsn0CNMaxawM=; b=D7vPyh+f4ftobEYbZy5w4K1h4EhaMLSnLIMy
	yggP8/Eingb5fooTcchCSA999TmslKJhWME4a2rW3DF0VpDsg9+SwBQuvo6TdLSO
	GYWVpxEszLKuX2Vv5KZzMYCILi2YLfBE0t5WANFCYqIGzFAyYeaQB9VK9OYh5ay8
	eQdYKoLc5NSrcA0BJRgel8fN2tRjOo0f0vbBF0r02J+TEh+gsnT9IeD/Vp9lec+S
	BiS1LgcjiGnIknhuisL1DaikL/pFFM09wNGUJqOX13ce1EUI1QSC+NM+NoDkEXz9
	fHKxNLVInoLB8peyL5Ruvmaz7jvm6uB6aWMNUBykAhcOSU5Fmg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7ww5r1ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0skp7031610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:46 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v15 50/50] ASoC: doc: Add documentation for SOC USB
Date: Mon, 12 Feb 2024 16:54:22 -0800
Message-ID: <20240213005422.3121-51-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240213005422.3121-1-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JdW0WHYvG4qTRipkhCNdwC5RWgj5gVEG
X-Proofpoint-ORIG-GUID: JdW0WHYvG4qTRipkhCNdwC5RWgj5gVEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: NTHUOPEYLQAEJA43K7F3DR557SUURE4I
X-Message-ID-Hash: NTHUOPEYLQAEJA43K7F3DR557SUURE4I
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTHUOPEYLQAEJA43K7F3DR557SUURE4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the introduction of the soc-usb driver, add documentation highlighting
details on how to utilize the new driver and how it interacts with
different components in USB SND and ASoC.  It provides examples on how to
implement the drivers that will need to be introduced in order to enable
USB audio offloading.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 Documentation/sound/soc/index.rst |   1 +
 Documentation/sound/soc/usb.rst   | 611 ++++++++++++++++++++++++++++++
 2 files changed, 612 insertions(+)
 create mode 100644 Documentation/sound/soc/usb.rst

diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
index e57df2dab2fd..8bed8f8f48da 100644
--- a/Documentation/sound/soc/index.rst
+++ b/Documentation/sound/soc/index.rst
@@ -18,3 +18,4 @@ The documentation is spilt into the following sections:-
    jack
    dpcm
    codec-to-codec
+   usb
diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
new file mode 100644
index 000000000000..3f7c3ef6a0c0
--- /dev/null
+++ b/Documentation/sound/soc/usb.rst
@@ -0,0 +1,611 @@
+================
+ASoC USB support
+================
+
+Overview
+========
+In order to leverage the existing USB sound device support in ALSA, the
+introduction of the ASoC USB APIs, allow for the entities to communicate
+with one another.
+
+One potential use case would be to support USB audio offloading, which is
+an implementation that allows for an external DSP on the SoC to handle the
+transfer of audio data over the USB bus.  This would let the main
+processor to stay in lower power modes for longer durations.  The following
+is an example design of how the ASoC and ALSA pieces can be connected
+together to achieve this:
+
+::
+
+               USB                   |            ASoC
+                                     |  _________________________
+                                     | |   ASoC Platform card    |
+                                     | |_________________________|
+                                     |         |           |
+                                     |      ___V____   ____V____
+                                     |     |ASoC BE | |ASoC FE  |
+                                     |     |DAI LNK | |DAI LNK  |
+                                     |     |________| |_________|
+                                     |         ^  ^        ^
+                                     |         |  |________|
+                                     |      ___V____    |
+                                     |     |SOC-USB |   |
+     ________       ________               |        |   |
+    |USB SND |<--->|USBSND  |<------------>|________|   |
+    |(card.c)|     |offld   |<----------                |
+    |________|     |________|___     | |                |
+        ^               ^       |    | |    ____________V_________
+        |               |       |    | |   |IPC                   |
+     __ V_______________V_____  |    | |   |______________________|
+    |USB SND (endpoint.c)     | |    | |              ^
+    |_________________________| |    | |              |
+                ^               |    | |   ___________V___________
+                |               |    | |->|audio DSP              |
+     ___________V_____________  |    |    |_______________________|
+    |XHCI HCD                 |<-    |
+    |_________________________|      |
+
+
+SOC USB driver
+==============
+Structures
+----------
+``struct snd_soc_usb``
+
+  - ``list``: list head for SND SOC struct list
+  - ``dev``: USB backend device reference
+  - ``component``: reference to ASoC component
+  - ``active_list``: active sessions
+  - ``num_supported_streams``: number of supported concurrent sessions
+  - ``connection_status_cb``: callback to notify connection events
+  - ``put_offload_dev``: callback to select USB sound card/PCM device
+  - ``get_offload_dev``: callback to fetch selected USB sound card/PCM device
+  - ``priv_data``: driver data
+
+The snd_soc_usb structure can be referenced using the ASoC platform card
+device, or a USB device (udev->dev).  This is created by the ASoC BE DAI
+link, and the USB sound entity will be able to pass information to the
+ASoC BE DAI link using this structure.
+
+``struct snd_soc_usb_device``
+
+  - ``card_idx``: sound card index associated with USB device
+  - ``chip_idx``: USB sound chip array index
+  - ``num_playback``: number of playback streams
+  - ``num_capture``: number of capture streams
+
+The struct snd_soc_usb_device is created by the USB sound offload driver.
+This will carry basic parameters/limitations that will be used to
+determine the possible offloading paths for this USB audio device.
+
+``struct snd_soc_usb_session``
+
+  - ``active_card_idx``: active offloaded sound card
+  - ``active_pcm_idx``: active offloaded PCM device
+  - ``state``: USB BE DAI link PCM state
+
+The struct snd_soc_usb_session tracks the current offloading state for a
+particular card and PCM combination.  This structure is carried/saved as
+part of the active_list within struct snd_soc_usb.
+
+The number of entities in the active list corresponds to the number of
+snd_soc_usb_session structures that are allocated.  This is controlled
+by the num_supported_streams that is reported as part of the SOC USB
+structure creation.
+
+Functions
+---------
+.. code-block:: rst
+
+	const char *snd_soc_usb_get_components_tag(bool playback);
+..
+
+  - ``playback``: direction of audio stream
+
+**snd_soc_usb_get_components_tag()** returns the tag used for describing if USB
+offloading is supported for appending to the ASoC platform card's components
+string.
+
+Returns a tag based on the direction of the audio stream.
+
+.. code-block:: rst
+
+	int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
+			int direction)
+..
+
+  - ``card_idx``: the index into the USB sound chip array.
+  - ``params``: Requested PCM parameters from the USB DPCM BE DAI link
+  - ``direction``: capture or playback
+
+**snd_soc_usb_find_format()** ensures that the requested audio profile being
+requested by the external DSP is supported by the USB device.
+
+Returns 0 on success, and -EOPNOTSUPP on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+..
+
+  - ``usbdev``: the usb device that was discovered
+  - ``sdev``: capabilities of the device
+
+**snd_soc_usb_connect()** notifies the ASoC USB DCPM BE DAI link of a USB
+audio device detection.  This can be utilized in the BE DAI
+driver to keep track of available USB audio devices.  This is intended
+to be called by the USB offload driver residing in USB SND.
+
+Returns 0 on success, negative error code on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+..
+
+  - ``usbdev``: the usb device that was removed
+  - ``sdev``: capabilities to free
+
+**snd_soc_usb_disconnect()** notifies the ASoC USB DCPM BE DAI link of a USB
+audio device removal.  This is intended to be called by the USB offload
+driver that resides in USB SND.
+
+.. code-block:: rst
+
+	void *snd_soc_usb_find_priv_data(struct device *usbdev)
+..
+
+  - ``usbdev``: the usb device to reference to find private data
+
+**snd_soc_usb_find_priv_data()** fetches the private data saved to the SOC USB
+device.
+
+Returns pointer to priv_data on success, NULL on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_device_offload_available(struct device *dev)
+..
+
+  - ``dev``: the device to find in SOC USB
+
+**snd_soc_usb_device_offload_available()** fetch the sound card number associated
+to the USB BE DAI link.
+
+Returns a valid sound card index on success, negative on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
+..
+
+  - ``usb``: SOC USB device
+  - ``card_idx``: USB sound card index
+  - ``pcm_idx``: USB PCM device index
+
+**snd_soc_usb_prepare_session()** populates active_list with a 'struct
+snd_soc_usb_session.'  This will move the session into the SND_SOC_USB_PREPARED
+state.  State updates will always start here.
+
+Returns index to active_list on success, -EBUSY on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
+..
+
+  - ``usb``: SOC USB device
+  - ``session_id``: session id returned by **snd_soc_usb_prepare_session()**
+
+**snd_soc_usb_shutdown_session()** frees up a slot in active_list, which signals
+that there is no longer an active offloading device.  This allows for another
+session to be started.
+
+Returns 0 on success, -EINVAL if session index is invalid.
+
+.. code-block:: rst
+
+	int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+						enum snd_soc_usb_dai_state state);
+..
+
+  - ``usb``: SOC USB device
+  - ``session_id``: session id returned by **snd_soc_usb_prepare_session()**
+  - ``state``: state to move into
+
+**snd_soc_usb_set_session_state()** moves an offloading session to the desired
+state.
+
+.. code-block:: rst
+
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+					struct snd_soc_jack *jack)
+..
+
+  - ``component``: ASoC component to add the jack
+  - ``jack``: ASoC sound jack to add
+
+**snd_soc_usb_setup_offload_jack()** is a helper to add a sound jack control to
+the platform sound card.  This will allow for consistent naming to be used on
+designs that support USB audio offloading.
+
+Returns 0 on success, negative otherwise.
+
+.. code-block:: rst
+
+	struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+			int num_supported_streams, void *data);
+..
+
+  - ``component``: DPCM BE DAI link component
+  - ``num_supported_streams``: number of active streams supported by external DSP
+  - ``data``: private data
+
+**snd_soc_usb_allocate_port()** allocates a SOC USB device and populates standard
+parameters that is used for further operations.
+
+Returns a pointer to struct soc_usb on success, negative on error.
+
+.. code-block:: rst
+
+	void snd_soc_usb_free_port(struct snd_soc_usb *usb);
+..
+
+  - ``usb``: SOC USB device to free
+
+**snd_soc_usb_free_port()** frees a SOC USB device.
+
+.. code-block:: rst
+
+	int snd_soc_usb_add_port(struct snd_soc_usb *usb);
+..
+
+  - ``usb``: SOC USB device to add
+
+**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
+Once added, this device can be referenced by further operations.
+
+.. code-block:: rst
+
+	int snd_soc_usb_remove_port(struct snd_soc_usb *usb);
+..
+
+  - ``usb``: SOC USB device to remove
+
+**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
+After removing a device, any SOC USB operations would not be able to reference the
+device removed.
+
+How to Register to SOC USB
+--------------------------
+The ASoC DPCM USB BE DAI link is the entity responsible for allocating and
+registering the SOC USB device on the component bind.  Likewise, it will
+also be responsible for freeing the allocated resources.  An example can
+be shown below:
+
+.. code-block:: rst
+
+	static int q6usb_component_probe(struct snd_soc_component *component)
+	{
+		...
+		data->usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
+		if (!data->usb)
+			return -ENOMEM;
+
+		usb->connection_status_cb = q6usb_alsa_connection_cb;
+
+		ret = snd_soc_usb_add_port(usb);
+		if (ret < 0) {
+			dev_err(component->dev, "failed to add usb port\n");
+			goto free_usb;
+		}
+		...
+	}
+
+	static void q6usb_component_remove(struct snd_soc_component *component)
+	{
+		...
+		snd_soc_usb_remove_port(data->usb);
+		snd_soc_usb_free_port(data->usb);
+	}
+
+	static const struct snd_soc_component_driver q6usb_dai_component = {
+		.probe = q6usb_component_probe,
+		.remove = q6usb_component_remove,
+		.name = "q6usb-dai-component",
+		...
+	};
+..
+
+BE DAI links can pass along vendor specific information as part of the
+call to allocate the SOC USB device.  This will allow any BE DAI link
+parameters or settings to be accessed by the USB offload driver that
+resides in USB SND.
+
+USB Audio Device Connection Flow
+--------------------------------
+USB devices can be hotplugged into the USB root hub at any point in time.
+The BE DAI link should be aware of the current state of the physical USB
+port, i.e. if there are any USB devices with audio interface(s) connected.
+The following callback can be used to notify the BE DAI link of any change:
+
+	**connection_status_cb()**
+
+This is called whenever there is a USB SND interface bind or remove event,
+using snd_soc_usb_connect() or snd_soc_usb_disconnect():
+
+.. code-block:: rst
+
+	static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
+	{
+		...
+		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
+		...
+	}
+
+	static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
+	{
+		...
+		snd_soc_usb_disconnect(usb_get_usb_backend(chip->dev), dev->sdev);
+		...
+	}
+..
+
+In order to account for conditions where driver or device existence is
+not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
+connect events for any identified USB audio interfaces.  Consider the
+the following situtation:
+
+	**usb_audio_probe()**
+	  | --> USB audio streams allocated and saved to usb_chip[]
+	  | --> Propagate connect event to USB offload driver in USB SND
+	  | --> **snd_soc_usb_connect()** exits as USB BE DAI link is not ready
+
+	BE DAI link component probe
+	  | --> DAI link is probed and SOC USB port is allocated
+	  | --> The USB audio device connect event is missed
+
+To ensure connection events are not missed, **snd_usb_rediscover_devices()**
+is executed when the SOC USB device is registered.  Now, when the BE DAI
+link component probe occurs, the following highlights the sequence:
+
+	BE DAI link component probe
+	  | --> DAI link is probed and SOC USB port is allocated
+	  | --> SOC USB device added, and **snd_usb_rediscover_devices()** runs
+
+	**snd_usb_rediscover_devices()**
+	  | --> Traverses through usb_chip[] and for non-NULL entries issue
+	  |     **connection_status_cb()**
+
+In the case where the USB offload driver is unbounded, while USB SND is
+ready, the **snd_usb_rediscover_devices()** is called during module init.
+This allows for the offloading path to also be enabled with the following
+flow:
+
+	**usb_audio_probe()**
+	  | --> USB audio streams allocated and saved to usb_chip[]
+	  | --> Propagate connect event to USB offload driver in USB SND
+	  | --> USB offload driver **NOT** ready!
+
+	BE DAI link component probe
+	  | --> DAI link is probed and SOC USB port is allocated
+	  | --> No USB connect event due to missing USB offload driver
+
+	USB offload driver probe
+	  | --> **qc_usb_audio_offload_init()**
+	  | --> Calls **snd_usb_rediscover_devices()** to notify of devices
+
+Advertising USB Audio Offload Capability
+----------------------------------------
+As the USB audio offloading can potentially reside within the platform ASoC based
+sound card, depending on if there is a USB DPCM backend DAI link existing in the
+platform card definition, then users can utilize the sound card's components string,
+in order to signal that USB offloading is supported by this sound card.
+
+The sound core exposes:
+
+	**snd_ctl_card_info()**
+
+This allows for userspace applications, i.e. amixer, to fetch the components string
+that was created as part of the ASoC platform sound card creation routine.  The
+possible tags that can be seen are:
+
+	- **usbplybkoffld: 1**
+	- **usbcapoffld: 1**
+
+**usbplybkoffld** translates to usb offload playback supported, and **usbcapoffld**
+translates to USB offload capture supported.  Applications can then query the sound
+card for further offload status parameters.
+
+SOC USB and USB Sound Kcontrols
+===============================
+Details
+-------
+SOC USB and USB sound expose a set of SND kcontrols for applications to select
+and fetch the current offloading status for the ASoC platform sound card. Kcontrols
+are split between two layers:
+
+	- USB sound - Notifies the sound card number for the ASoC platform sound
+	  card that it is registered to for supporting audio offload.
+
+	- SOC USB - Maintains the current status of the offload path, and device
+	  (USB sound card and PCM device) information.  This would be the main
+	  card that applications can read to determine offloading capabilities.
+
+Implementation
+--------------
+
+**Example:**
+
+  **Sound Cards**:
+
+	::
+
+	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
+                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
+	  1 [C320M          ]: USB-Audio - Plantronics C320-M
+                     Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1, full speed
+
+
+  **Platform Sound Card** - card#0:
+
+	::
+
+	  USB Offload Playback Route Status      -1, -1 (range -1->32)
+	  USB Offload Playback Route Select       1, 0 (range -1->32)
+
+
+  **USB Sound Card** - card#1:
+
+	::
+
+	  USB Offload Playback Capable Card         0 (range -1->32)
+
+
+The platform sound card(card#0) kcontrols are created as part of adding the SOC
+USB device using **snd_soc_usb_add_port()**.  The following kcontrols are defined
+as:
+
+  - ``USB Offload Playback Route Status`` **(R)**: USB sound card and PCM device
+    index pair that defines which USB SND resources are currently offloaded.  If
+    -1, -1 is seen, it signifies that offload is not active.
+  - ``USB Offload Playback Route Select`` **(R/W)**: USB sound card and PCM device
+    index pair which selects the USB device to initiate offloading on.  If no value
+    is written to the kcontrol, then the last USB device discovered will be chosen.
+
+The USB sound card(card#1) kcontrols are created as USB audio devices are plugged
+into the physical USB port and enumerated.  The kcontrols are defined as:
+
+  - ``USB Offload Playback Capable Card`` **(R)**: Provides the sound card
+    number/index that supports USB offloading.  Further/follow up queries about
+    the current offload state can be handled by reading the offload status
+    kcontrol exposed by the platform card.
+
+USB Offload Playback Route Select Kcontrol
+-----------------------------------
+In order to allow for vendor specific implementations on audio offloading device
+selection, the SOC USB layer exposes the following:
+
+.. code-block:: rst
+
+	int (*put_offload_dev)(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol);
+	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol);
+..
+
+These are specific for the **USB Offload Playback Route Select** kcontrol.
+
+When users issue get/put calls to the kcontrol, the registered SOC USB callbacks
+will execute the registered function calls to the DPCM BE DAI link.
+
+**Callback Registration:**
+
+.. code-block:: rst
+
+	static int q6usb_component_probe(struct snd_soc_component *component)
+	{
+	...
+	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
+	if (IS_ERR(usb))
+		return -ENOMEM;
+
+	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->put_offload_dev = q6usb_put_offload_dev;
+	usb->get_offload_dev = q6usb_get_offload_dev;
+
+	ret = snd_soc_usb_add_port(usb);
+..
+
+**PUT Callback:**
+
+Can be used to track current device selection, and to issue any external DSP
+commands that might be required for enabling audio offloading.
+
+.. code-block:: rst
+
+	static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+	{
+	...
+	if ((cardidx >= 0 && test_bit(cardidx, &data->available_card_slot))) {
+		data->sel_card_idx = cardidx;
+		changed = 1;
+	}
+
+	if ((pcmidx >= 0 && pcmidx < data->status[cardidx].sdev->num_playback)) {
+		data->sel_pcm_idx = pcmidx;
+		changed = 1;
+	}
+..
+
+The above is an example of keeping track of what the userspace entity is
+selecting as the playback device.  This can be later used to pass the information
+along to the external DSP.
+
+
+USB Offload Playback Route Status
+-------------------
+SOC USB exposes APIs for keeping track of the offloading state, and expects this
+to be maintained by the BE DAI link that created/added the SOC USB device.
+
+**SOC USB State Flow Example**
+
+::
+
+     PCM Core              |      BE USB DAI Link      |     SOC USB
+                           |                           |
+  snd_pcm_hw_params --------> dai_link->ops->hw_params --> snd_soc_usb_prepare_session
+                           |                           |   |--> state = SND_SOC_USB_PREPARED
+  ...                      |                           |   |--> slot[0] now active
+                           |                           |
+                           |                           |
+  snd_pcm_do_prepare--------> dai_link->ops->prepare ---> snd_soc_usb_set_session_state
+                           |                           |   |--> state = SND_SOC_USB_RUNNING
+  ...                      |                           |
+                           |                           |
+  snd_pcm_release_substream-> dai_link->ops->shutdown---> snd_soc_usb_shutdown_session
+                           |                           |   |--> state = SND_SOC_USB_IDLE
+                           |                           |   |--> slot[0] now idle
+
+
+When executing the kcontrol get callback, it will loop across the active_list array
+and report to the application for active USB sound card and USB PCM device indexes.
+
+USB Offload Playback Capable Card
+-------------------------------
+USB sound also creates a kcontrol for applications to help determine which platform
+sound card USB offloading is linked to.  This will allow applications to further
+query the platform sound card for specific information about the current USB offload
+status.
+
+This is added as a separate mixer driver:
+  - mixer_usb_offload.c
+  - kcontrol: snd_usb_offload_available_ctl
+
+**snd_usb_offload_available_get()** fetches the associated sound card by utilizing
+the **snd_soc_usb_device_offload_available()** API.
+
+Mixer Examples
+--------------
+
+	::
+
+	  tinymix -D 0 set 'USB Offload Playback Route Select' 2 0
+
+
+	::
+
+	  tinymix -D 0 get 'USB Offload Playback Route Select'
+	  --> 2, 0 (range 0->32)
+
+	::
+
+	  tinymix -D 0 get 'USB Offload Playback Route Status'
+	  --> 2, 0 (range -1->32)   [OFFLD active]
+	  --> -1, -1 (range -1->32) [OFFLD idle]
+
+	::
+
+	  tinymix -D 0 get 'USB Offload Playback Capable Card'
+	  --> 0 (range 0->32)
