Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BDD7605D3
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED5B4EAC;
	Tue, 25 Jul 2023 04:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED5B4EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252864;
	bh=SLA85lsNwy7h9RWIEBpyGQIWVuzCXQQOVXbQRzuhf38=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tjCj1w8ItLUjxEnfz8LaqFDYSd/kF2BkLWZbiB0loznFEqHCp4+0iZZrO+MgOSsHe
	 sRjqgKDAcUop8DibQ5ZT4cpie2aBqzIHC+oza2Mh2tK8HHRMfOMNudge19Rp8//B6h
	 HOT7SV3q+DOBs+n+6gktg25HjQzzr4iQeFuh4FZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C98C4F80674; Tue, 25 Jul 2023 04:35:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02760F80656;
	Tue, 25 Jul 2023 04:35:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA3DF80563; Tue, 25 Jul 2023 04:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B3E4F8055B
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B3E4F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hlIdqQed
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P2OtSZ027134;
	Tue, 25 Jul 2023 02:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=NQp/QO5QXQF2G8sF8KUb7joRvWQVdLEz2onjgSlGkAY=;
 b=hlIdqQedjqtDD160lQ7qgWItbtETiwka9J+Yg4sNRjUCzFwh1qCBkehN3U5h0+jzA0DB
 SjTPGv4VvUY/swk8mjzPyjs0bi2SgqXzapGySef26kjiUriD+4YyP87Ix1DfhWQzQO0x
 TpEv8i379BRTZY8WRP1M4THFy7zUWfIzcma0PcletghaWtLTCUyWUGtmzqp9QyQILi3i
 XP4Fq4nH8SSGJWB2JV6a/14iRQh2bXZm6u7EJMSJ5nwxQABu1JvL2bxyRjjH8dfqif7C
 w25PjLXJ6MDMNCTA52sL2dtqMWtb6ipS68bBGAZrYaaBjSookBlMBQ1gy0RBmU+8D9p9 8g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1pfh9yny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YTJt014837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:29 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:28 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 00/32] Introduce QC USB SND audio offloading support
Date: Mon, 24 Jul 2023 19:33:44 -0700
Message-ID: <20230725023416.11205-1-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YpSjPidAy9tuboumpthVYTPGwOMZpb74
X-Proofpoint-GUID: YpSjPidAy9tuboumpthVYTPGwOMZpb74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307250021
Message-ID-Hash: SO334EADE42T2BO3XGLBMKW7WPCZYR2V
X-Message-ID-Hash: SO334EADE42T2BO3XGLBMKW7WPCZYR2V
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SO334EADE42T2BO3XGLBMKW7WPCZYR2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several Qualcomm based chipsets can support USB audio offloading to a
dedicated audio DSP, which can take over issuing transfers to the USB
host controller.  The intention is to reduce the load on the main
processors in the SoC, and allow them to be placed into lower power modes.
There are several parts to this design:
  1. Adding ASoC binding layer
  2. Create a USB backend for Q6DSP
  3. Introduce XHCI interrupter support
  4. Create vendor ops for the USB SND driver

      USB                          |            ASoC
--------------------------------------------------------------------
                                   |  _________________________
                                   | |sm8250 platform card     |
                                   | |_________________________|
                                   |         |           |
                                   |      ___V____   ____V____
                                   |     |Q6USB   | |Q6AFE    |  
                                   |     |"codec" | |"cpu"    |
                                   |     |________| |_________|
                                   |         ^  ^        ^
                                   |         |  |________|
                                   |      ___V____    |
                                   |     |SOC-USB |   |
   ________       ________               |        |   |
  |USB SND |<--->|QC offld|<------------>|________|   |
  |(card.c)|     |        |<----------                |
  |________|     |________|___     | |                |
      ^               ^       |    | |    ____________V_________
      |               |       |    | |   |APR/GLINK             |
   __ V_______________V_____  |    | |   |______________________|
  |USB SND (endpoint.c)     | |    | |              ^
  |_________________________| |    | |              |
              ^               |    | |   ___________V___________
              |               |    | |->|audio DSP              |
   ___________V_____________  |    |    |_______________________|
  |XHCI HCD                 |<-    |
  |_________________________|      |


Adding ASoC binding layer:
soc-usb: Intention is to treat a USB port similar to a headphone jack.
The port is always present on the device, but cable/pin status can be
enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
communicate with USB SND.

Create a USB backend for Q6DSP:
q6usb: Basic backend driver that will be responsible for maintaining the
resources needed to initiate a playback stream using the Q6DSP.  Will
be the entity that checks to make sure the connected USB audio device
supports the requested PCM format.  If it does not, the PCM open call will
fail, and userpsace ALSA can take action accordingly.

Introduce XHCI interrupter support:
XHCI HCD supports multiple interrupters, which allows for events to be routed
to different event rings.  This is determined by "Interrupter Target" field
specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.

Events in the offloading case will be routed to an event ring that is assigned
to the audio DSP.

Create vendor ops for the USB SND driver:
qc_audio_offload: This particular driver has several components associated
with it:
- QMI stream request handler
- XHCI interrupter and resource management
- audio DSP memory management

When the audio DSP wants to enable a playback stream, the request is first
received by the ASoC platform sound card.  Depending on the selected route,
ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
will send an AFE port start command (with enabling the USB playback path), and
the audio DSP will handle the request accordingly.

Part of the AFE USB port start handling will have an exchange of control
messages using the QMI protocol.  The qc_audio_offload driver will populate the
buffer information:
- Event ring base address
- EP transfer ring base address

and pass it along to the audio DSP.  All endpoint management will now be handed
over to the DSP, and the main processor is not involved in transfers.

Overall, implementing this feature will still expose separate sound card and PCM
devices for both the platorm card and USB audio device:
 0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
                      SM8250-MTP-WCD9380-WSA8810-VA-DMIC
 1 [Audio          ]: USB-Audio - USB Audio
                      Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed

This is to ensure that userspace ALSA entities can decide which route to take
when executing the audio playback.  In the above, if card#1 is selected, then
USB audio data will take the legacy path over the USB PCM drivers, etc...

This feature was validated using:
- tinymix: set/enable the multimedia path to route to USB backend
- tinyplay: issue playback on platform card

Changelog
--------------------------------------------
Changes in v4:
- Rebased to xhci/for-usb-next
- Addressed some dt-bindings comments

XHCI:
- Pulled in latest changes from Mathias' feature_interrupters branch:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters

- Fixed commit text and signage for the XHCI sideband/interrupter related changes
- Added some logic to address the FIXME tags mentioned throughout the commits, such
as handling multi segment rings and building the SGT, locking concerns, and ep
cleanup operations.
- Removed some fixme tags for conditions that may not be needed/addressed.
- Repurposed the new endpoint stop sync API to be utilized in other places.
- Fixed potential compile issue if XHCI sideband config is not defined.

ASoC:
- Added sound jack control into the Q6USB driver.  Allows for userpsace to know when
an offload capable device is connected.

USB SND:
- Avoided exporting _snd_pcm_hw_param_set based on Takashi's recommendation.
- Split USB QMI packet header definitions into a separate commit.  This is used to
properly allow the QMI interface driver to parse and route QMI packets accordingly
- Added a "depends on" entry when enabling QC audio offload to avoid compile time
issues.

Changes in v3:
- Changed prefix from RFC to PATCH
- Rebased entire series to usb-next
- Updated copyright years

XHCI:
- Rebased changes on top of XHCI changes merged into usb-next, and only added
changes that were still under discussion.
- Added change to read in the "num-hc-interrupters" device property.

ASoC:
- qusb6 USB backend
  - Incorporated suggestions to fetch iommu information with existing APIs
  - Added two new sound kcontrols to fetch offload status and offload device
    selection.
    - offload status - will return the card and pcm device in use
        tinymix -D 0 get 1 --> 1, 0 (offload in progress on card#1 pcm#0)

    - device selection - set the card and pcm device to enable offload on. Ex.:
        tinymix -D 0 set 1 2 0  --> sets offload on card#2 pcm#0
                                    (this should be the USB card)

USB SND:
- Fixed up some locking related concerns for registering platform ops.
   - Moved callbacks under the register_mutex, so that 
- Modified APIs to properly pass more information about the USB SND device, so
that the Q6USB backend can build a device list/map, in order to monitor offload
status and device selection.

Changes in v2:

XHCI:
- Replaced XHCI and HCD changes with Mathias' XHCI interrupter changes
in his tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters

Adjustments made to Mathias' changes:
  - Created xhci-intr.h to export/expose interrupter APIs versus exposing xhci.h.
    Moved dependent structures to this file as well. (so clients can parse out
    information from "struct xhci_interrupter")
  - Added some basic locking when requesting interrupters.
  - Fixed up some sanity checks.
  - Removed clearing of the ERSTBA during freeing of the interrupter. (pending
    issue where SMMU fault occurs if DMA addr returned is 64b - TODO)

- Clean up pending events in the XHCI secondary interrupter.  While testing USB
bus suspend, it was seen that on bus resume, the xHCI HC would run into a command
timeout.
- Added offloading APIs to xHCI to fetch transfer and event ring information.

ASoC:
- Modified soc-usb to allow for multiple USB port additions.  For this to work,
the USB offload driver has to have a reference to the USB backend by adding
a "usb-soc-be" DT entry to the device saved into XHCI sysdev.
- Created separate dt-bindings for defining USB_RX port.
- Increased APR timeout to accommodate the situation where the AFE port start
command could be delayed due to having to issue a USB bus resume while
handling the QMI stream start command.

USB SND:
- Added a platform ops during usb_audio_suspend().  This allows for the USB
offload driver to halt the audio stream when system enters PM suspend.  This
ensures the audio DSP is not issuing transfers on the USB bus.
- Do not override platform ops if they are already populated.
- Introduce a shared status variable between the USB offload and USB SND layers,
to ensure that only one path is active at a time.  If the USB bus is occupied,
then userspace is notified that the path is busy.

Mathias Nyman (3):
  xhci: add support to allocate several interrupters
  xhci: add helper to stop endpoint and wait for completion
  xhci: sideband: add initial api to register a sideband entity

Wesley Cheng (29):
  usb: host: xhci-mem: Cleanup pending secondary event ring events
  usb: host: xhci-mem: Allow for interrupter clients to choose specific
    index
  ASoC: Add SOC USB APIs for adding an USB backend
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
  ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
  ASoC: qdsp6: q6afe: Increase APR timeout
  ASoC: qcom: Add USB backend ASoC driver for Q6
  sound: usb: card: Introduce USB SND platform op callbacks
  sound: usb: Export USB SND APIs for modules
  dt-bindings: usb: dwc3: Add snps,num-hc-interrupters definition
  usb: dwc3: Add DT parameter to specify maximum number of interrupters
  usb: host: xhci-plat: Set XHCI max interrupters if property is present
  sound: usb: pcm: Export fixed rate check USB SND API
  sound: usb: qcom: Add USB QMI definitions
  sound: usb: Introduce QC USB SND offloading support
  sound: usb: card: Check for support for requested audio format
  sound: soc: soc-usb: Add PCM format check API for USB backend
  sound: soc: qcom: qusb6: Ensure PCM format is supported by USB audio
    device
  sound: usb: Prevent starting of audio stream if in use
  ASoC: dt-bindings: Add Q6USB backend bindings
  ASoC: dt-bindings: Update example for enabling USB offload on SM8250
  ASoC: qcom: qdsp6: q6afe: Split USB AFE dev_token param into separate
    API
  sound: Pass USB SND card and PCM information to SOC USB
  sound: soc: qdsp6: Add SND kcontrol to select offload device
  sound: soc: qdsp6: Add SND kcontrol for fetching offload status
  sound: soc: qcom: q6usb: Add headphone jack for offload connection
    status
  sound: usb: qc_audio_offload: Use card and PCM index from QMI request
  sound: usb: card: Allow for rediscovery of connected USB SND devices
  sound: soc: soc-usb: Rediscover USB SND devices on USB port add

 .../bindings/sound/qcom,q6usb-dais.yaml       |   49 +
 .../bindings/sound/qcom,sm8250.yaml           |   15 +
 .../devicetree/bindings/usb/snps,dwc3.yaml    |   13 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi.rej      |   14 +
 arch/arm64/configs/defconfig.rej              |   24 +
 drivers/usb/dwc3/core.c                       |   12 +
 drivers/usb/dwc3/core.h                       |    2 +
 drivers/usb/dwc3/host.c                       |    5 +-
 drivers/usb/host/Kconfig                      |    9 +
 drivers/usb/host/Makefile                     |    4 +
 drivers/usb/host/xhci-debugfs.c               |    2 +-
 drivers/usb/host/xhci-hub.c                   |   29 +-
 drivers/usb/host/xhci-mem.c                   |  167 +-
 drivers/usb/host/xhci-plat.c                  |    2 +
 drivers/usb/host/xhci-ring.c                  |    2 +-
 drivers/usb/host/xhci-sideband.c              |  195 ++
 drivers/usb/host/xhci.c                       |  109 +-
 drivers/usb/host/xhci.h                       |  102 +-
 .../sound/qcom,q6dsp-lpass-ports.h            |    1 +
 include/linux/usb/xhci-intr.h                 |   86 +
 include/linux/usb/xhci-sideband.h             |   90 +
 include/sound/q6usboffload.h                  |   20 +
 include/sound/soc-usb.h                       |   39 +
 sound/core/oss/pcm_oss.c                      |    4 +-
 sound/soc/Makefile                            |    2 +-
 sound/soc/qcom/Kconfig                        |    4 +
 sound/soc/qcom/qdsp6/Makefile                 |    1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   50 +
 sound/soc/qcom/qdsp6/q6afe.c                  |  208 +-
 sound/soc/qcom/qdsp6/q6afe.h                  |   47 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   23 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |    1 +
 sound/soc/qcom/qdsp6/q6routing.c              |    9 +
 sound/soc/qcom/qdsp6/q6usb.c                  |  458 +++++
 sound/soc/soc-usb.c                           |  197 ++
 sound/usb/Kconfig                             |   15 +
 sound/usb/Makefile                            |    2 +-
 sound/usb/card.c                              |   85 +
 sound/usb/card.h                              |   32 +
 sound/usb/endpoint.c                          |    2 +
 sound/usb/helper.c                            |    1 +
 sound/usb/pcm.c                               |   29 +-
 sound/usb/pcm.h                               |   12 +
 sound/usb/qcom/Makefile                       |    2 +
 sound/usb/qcom/qc_audio_offload.c             | 1820 +++++++++++++++++
 sound/usb/qcom/usb_audio_qmi_v01.c            |  892 ++++++++
 sound/usb/qcom/usb_audio_qmi_v01.h            |  162 ++
 47 files changed, 4870 insertions(+), 179 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350.dtsi.rej
 create mode 100644 arch/arm64/configs/defconfig.rej
 create mode 100644 drivers/usb/host/xhci-sideband.c
 create mode 100644 include/linux/usb/xhci-intr.h
 create mode 100644 include/linux/usb/xhci-sideband.h
 create mode 100644 include/sound/q6usboffload.h
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
 create mode 100644 sound/soc/soc-usb.c
 create mode 100644 sound/usb/qcom/Makefile
 create mode 100644 sound/usb/qcom/qc_audio_offload.c
 create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
 create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h

