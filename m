Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F18FA64F
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 01:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1749283E;
	Tue,  4 Jun 2024 01:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1749283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717456657;
	bh=4WRnzBMN3dcm6DM+T7qi3zxZSsH6mE3UP7BUvkHdClo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=esapaHfI/zL0OpIOn0i5UZkbP+Tz1EHRKajzNvu/Akd6nXkxTUU7WyH5mIadrfkAK
	 +eWzhdradhLkTjOppWtWWR9dUyy96u8IIsfxsohKgm+GCCfVSJCsBfAt7YTeVeUPF8
	 KBHwV/kvXXeVEdAj/g2divaMLzUe48siX8+0D1Tc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8079CF805A0; Tue,  4 Jun 2024 01:17:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E92F8F8059F;
	Tue,  4 Jun 2024 01:17:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F6BAF802DB; Tue,  4 Jun 2024 01:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89F04F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 01:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F04F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=it9/yjw4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 453DoklF026047;
	Mon, 3 Jun 2024 23:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+GjilXyJc5uv2Qstp73XW7XsQO3qCV1udkOay+MaNY=; b=it9/yjw47PvMln88
	DY+q5H68Rd7PmXzHdqfTRNxw2wa20Jdazd+vabbinOmLlvba7CqhiI1WJ0Aekph7
	6lXonhngbsZoq7SYlhTvBZoix/RtjT51ewfx47iNYJ9/882wVhsKSfjmEAek+U9Z
	h8usamHgjvgwbigQ9sTifVBFnSnfL7usQ9E2Ik5u9VYSgOFoZOPTfov2s2QBnhAw
	zWfc/FmH6qWQsftPPJNrGfxOb3yI9QWdKktcy7IoVt1mV/fKW7jVq9Q21Fb6y1mh
	BMWzPhoN1RZpQrj0IzBxI//ptJx4mB+4t7MQLUJt0Fd5cTAXqJgJoiCBCwvJ4/W0
	P3S8Vw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw42w5yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 23:16:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 453NG3Vb028228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 23:16:03 GMT
Received: from [10.110.93.51] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 16:16:02 -0700
Message-ID: <e570b27e-b0eb-2ffe-4baf-2933c8ae49fc@quicinc.com>
Date: Mon, 3 Jun 2024 16:15:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v22 00/38] Introduce QC USB SND audio offloading support
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240524001043.10141-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wkSEtPc2rJorcIcM2Ito56gH-zBKEgSh
X-Proofpoint-ORIG-GUID: wkSEtPc2rJorcIcM2Ito56gH-zBKEgSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030188
Message-ID-Hash: QTC6BP4BAZJO7RZ5WF3JNZ2W63E7YU3G
X-Message-ID-Hash: QTC6BP4BAZJO7RZ5WF3JNZ2W63E7YU3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTC6BP4BAZJO7RZ5WF3JNZ2W63E7YU3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/23/2024 5:10 PM, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 

Hi Takashi/Mark/Mathias,

Since this series includes dependencies from multiple SW areas and 
maintainers, can we consider getting some ACK'ed by/Reviewed by tags if 
things look good?  I believe Greg mentioned he would be open to add 
these all on usb-next when we get these tags.

That would probably make the submission easier to handle.

Thanks
Wesley Cheng

> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>    1. Adding ASoC binding layer
>    2. Create a USB backend for Q6DSP
>    3. Introduce XHCI interrupter support
>    4. Create vendor ops for the USB SND driver
> 
>        USB                          |            ASoC
> --------------------------------------------------------------------
>                                     |  _________________________
>                                     | |sm8250 platform card     |
>                                     | |_________________________|
>                                     |         |           |
>                                     |      ___V____   ____V____
>                                     |     |Q6USB   | |Q6AFE    |
>                                     |     |"codec" | |"cpu"    |
>                                     |     |________| |_________|
>                                     |         ^  ^        ^
>                                     |         |  |________|
>                                     |      ___V____    |
>                                     |     |SOC-USB |   |
>     ________       ________               |        |   |
>    |USB SND |<--->|QC offld|<------------>|________|   |
>    |(card.c)|     |        |<----------                |
>    |________|     |________|___     | |                |
>        ^               ^       |    | |    ____________V_________
>        |               |       |    | |   |APR/GLINK             |
>     __ V_______________V_____  |    | |   |______________________|
>    |USB SND (endpoint.c)     | |    | |              ^
>    |_________________________| |    | |              |
>                ^               |    | |   ___________V___________
>                |               |    | |->|audio DSP              |
>     ___________V_____________  |    |    |_______________________|
>    |XHCI HCD                 |<-    |
>    |_________________________|      |
> 
> 
> Adding ASoC binding layer:
> soc-usb: Intention is to treat a USB port similar to a headphone jack.
> The port is always present on the device, but cable/pin status can be
> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> communicate with USB SND.
> 
> Create a USB backend for Q6DSP:
> q6usb: Basic backend driver that will be responsible for maintaining the
> resources needed to initiate a playback stream using the Q6DSP.  Will
> be the entity that checks to make sure the connected USB audio device
> supports the requested PCM format.  If it does not, the PCM open call will
> fail, and userpsace ALSA can take action accordingly.
> 
> Introduce XHCI interrupter support:
> XHCI HCD supports multiple interrupters, which allows for events to be routed
> to different event rings.  This is determined by "Interrupter Target" field
> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> 
> Events in the offloading case will be routed to an event ring that is assigned
> to the audio DSP.
> 
> Create vendor ops for the USB SND driver:
> qc_audio_offload: This particular driver has several components associated
> with it:
> - QMI stream request handler
> - XHCI interrupter and resource management
> - audio DSP memory management
> 
> When the audio DSP wants to enable a playback stream, the request is first
> received by the ASoC platform sound card.  Depending on the selected route,
> ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
> will send an AFE port start command (with enabling the USB playback path), and
> the audio DSP will handle the request accordingly.
> 
> Part of the AFE USB port start handling will have an exchange of control
> messages using the QMI protocol.  The qc_audio_offload driver will populate the
> buffer information:
> - Event ring base address
> - EP transfer ring base address
> 
> and pass it along to the audio DSP.  All endpoint management will now be handed
> over to the DSP, and the main processor is not involved in transfers.
> 
> Overall, implementing this feature will still expose separate sound card and PCM
> devices for both the platorm card and USB audio device:
>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>   1 [Audio          ]: USB-Audio - USB Audio
>                        Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
> 
> This is to ensure that userspace ALSA entities can decide which route to take
> when executing the audio playback.  In the above, if card#1 is selected, then
> USB audio data will take the legacy path over the USB PCM drivers, etc...
> 
> This feature was validated using:
> - tinymix: set/enable the multimedia path to route to USB backend
> - tinyplay: issue playback on platform card
> 
> Changelog
> --------------------------------------------
> Changes in v22:
> - Removed components tag for the ASoC platform card, as the USB SND kcontrol for
> notifying userspace of offload capable card achieves similar results.
> - Due to the above, had to remove the review-by tag for the RST documentation,
> as changes were made to remove the components tag section.
> - Took in feedback to make the SOC USB add/remove ports void.
> - Fixed an issue w/ the USB SND kcontrol management for devices that have multi
> UAC interfaces. (would attempt to create the kcontrol more than once)
> - Modified SOC USB card and PCM index select to be based off the num_supported
> streams that is specified by the USB BE DAI.
> - Modified comments on selecting the latest USB headset for offloading.
> 
> Changes in v21:
> - Added an offload jack disable path from the ASoC platform driver and SOC USB.
> - Refactored some of the existing SOC USB context look up APIs and created some
> new helpers to search for the USB context.
> - Renamed snd_soc_usb_find_format to snd_soc_usb_find_supported_format
> - Removed some XHCI sideband calls that would allow clients to actually enable
> the IRQ line associated w/ the secondary interrupter.  This is removed because
> there are other dependencies that are required for that to happen, which are not
> covered as part of this series, and to avoid confusion.
> - Due to the above, removed the need to export IMOD setting, and enable/disable
> interrupter APIs.
> 
> Changes in v20:
> - Fixed up some formatting changes pointed out in the usb.rst
> - Added SB null check during XHCI sideband unregister in case caller passes
> improper argument (xhci_sideband_unregister())
> 
> Changes in v19:
> - Rebased to usb-next to account for some new changes in dependent drivers.
> 
> Changes in v18:
> - Rebased to usb-next, which merged in part of the series.  Removed these patches.
> - Reworked Kconfigs for the ASoC USB related components from QCOM Q6DSP drivers
>    to keep dependencies in place for SoC USB and USB SND.
> - Removed the repurposing of the stop ep sync API into existing XHCI operations.
>    This will be solely used by the XHCI sideband for now.
> 
> Changes in v17:
> - Fixed an issue where one patch was squashed into another.
> - Re-added some kconfig checks for helpers exposed in USB SND for the soc usb
>    driver, after running different kconfigs.
> 
> Changes in v16:
> - Modified some code layer dependencies so that soc usb can be split as a separate
>    module.
>    - Split the kcontrols from ASoC QCOM common layer into a separate driver
> - Reworked SOC USB kcontrols for controlling card + pcm offload routing and status
>    so that there are individual controls for card and pcm devices.
> - Added a kcontrol remove API in SOC USB to remove the controls on the fly.  This
>    required to add some kcontrol management to SOC USB.
> - Removed the disconnect work and workqueue for the QC USB offload as it is not
>    required, since QMI interface driver ensures events are handled in its own WQ.
> 
> Changes in v15:
> - Removed some already merged XHCI changes
> - Separated SOC USB driver from being always compiled into SOC core.  Now
>    configurable from kconfig.
> - Fixed up ASoC kcontrol naming to fit guidelines.
> - Removed some unnecessary dummy ifdefs.
> - Moved usb snd offload capable kcontrol to be initialized by the platform offloading
>    driver.
> 
> Changes in v14:
> - Cleaned up some USB SND related feedback:
>    - Renamed SNDUSB OFFLD playback available --> USB offload capable card
>    - Fixed locking while checking if stream is in use
>    - Replaced some mutex pairs with guard(mutex)
> 
> Changes in v13:
> - Pulled in secondary/primary interrupter rework from Mathias from:
>    https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/drivers/usb/host?h=fix_eventhandling
>    - Did some cleanup and commit message updates, and tested on current code base.
> - Added mutex locking to xhci sideband to help prevent any race conditions, esp. for when accessing shared
>    references.
> - Addresed concerns from Hillf about gfp_flags and locking used in qc_usb_audio_offload.
> - Rebased onto usb-next
> 
> Changes in v12:
> - Updated copyright year to 2024.  Happy new years!
> - Fixed newline format on mixer offload driver.
> 
> Changes in v11:
> - Modified QMI format structures to be const
> 
> Changes in v10:
> - Added new mixer for exposing kcontrol for sound card created by USB SND.  This
> allows for applications to know which platform sound card has offload support.
> Will return the card number.
> - Broke down and cleaned up some functions/APIs within qc_audio_offload driver.
> - Exported xhci_initialize_ring_info(), and modified XHCI makefile to allow for
> the XHCI sideband to exist as a module.
> - Reworked the jack registration and moved it to the QCOM platform card driver,
> ie sm8250.
> - Added an SOC USB API to fetch a standard component tag that can be appended to
> the platform sound card.  Added this tag to sm8250 if any USB path exists within
> the DT node.
> - Moved kcontrols that existed in the Q6USB driver, and made it a bit more generic,
> so that naming can be standardized across solutions.  SOC USB is now responsible
> for creation of these kcontrols.
> - Added a SOC USB RST document explaining some code flows and implementation details
> so that other vendors can utilize the framework.
> - Addressed a case where USB device connection events are lost if usb offload driver
> (qc_audio_offload) is not probed when everything else has been initialized, ie
> USB SND, SOC USB and ASoC sound card.  Add a rediscover device call during module
> init, to ensure that connection events will be propagated.
> - Rebased to usb-next.
> 
> Changes in v9:
> - Fixed the dt binding check issue with regards to num-hc-interrupters.
> 
> Changes in v8:
> - Cleaned up snd_soc_usb_find_priv_data() based on Mark's feedback.  Removed some of
> the duplicate looping code that was present on previous patches.  Also renamed the API.
> - Integrated Mathias' suggestions on his new sideband changes:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
> - Addressed some of Mathias' fixme tags, such as:
>   - Resetting transfer ring dequeue/enqueue pointers
>   - Issuing stop endpoint command during ep removal
>   - Reset ERDP properly to first segment ring during interrupter removal. (this is currently
>     just being cleared to 0, but should be pointing to a valid segment if controller is still
>     running.
> 
> Changes in v7:
> - Fixed dt check error for q6usb bindings
> - Updated q6usb property from qcom,usb-audio-intr-num --> qcom,usb-audio-intr-idx
> - Removed separate DWC3 HC interrupters num property, and place limits to XHCI one.
> - Modified xhci_ring_to_sgtable() to use assigned IOVA/DMA address to fetch pages, as
> it is not ensured event ring allocated is always done in the vmalloc range.
> 
> Changes in v6:
> - Fixed limits and description on several DT bindings (XHCI and Q6USB)
> - Fixed patch subjects to follow other ALSA/ASoC notations.
> 
> USB SND
> - Addressed devices which expose multiple audio (UAC) interfaces.  These devices will
> create a single USB sound card with multiple audio streams, and receive multiple
> interface probe routines.  QC offload was not properly considering cases with multiple
> probe calls.
> - Renamed offload module name and kconfig to fit within the SND domain.
> - Renamed attach/detach endpoint API to keep the hw_params notation.
> 
> Changes in v5:
> - Removed some unnescessary files that were included
> - Fixed some typos mentioned
> - Addressed dt-binding issues and added hc-interrupters definition to usb-xhci.yaml
> 
> XHCI:
> - Moved secondary skip events API to xhci-ring and updated implementation
>     - Utilized existing XHCI APIs, such as inc_deq and xhci_update_erst_dequeue()
> 
> USB SND
> - Renamed and reworked the APIs in "sound: usb: Export USB SND APIs for modules" patch to
> include suggestions to utilize snd_usb_hw_params/free and to avoid generic naming.
> - Added a resume_cb() op for completion sake.
> - Addressed some locking concerns with regards to when registering for platform hooks.
> - Added routine to disconnect all offloaded devices during module unbind.
> 
> ASoC
> - Replaced individual PCM parameter arguments in snd_soc_usb_connect() with new
> snd_soc_usb_device structure to pass along PCM info.
> - Modified snd_jack set report to notify HEADPHONE event, as we do not support record path.
> 
> Changes in v4:
> - Rebased to xhci/for-usb-next
> - Addressed some dt-bindings comments
> 
> XHCI:
> - Pulled in latest changes from Mathias' feature_interrupters branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
> 
> - Fixed commit text and signage for the XHCI sideband/interrupter related changes
> - Added some logic to address the FIXME tags mentioned throughout the commits, such
> as handling multi segment rings and building the SGT, locking concerns, and ep
> cleanup operations.
> - Removed some fixme tags for conditions that may not be needed/addressed.
> - Repurposed the new endpoint stop sync API to be utilized in other places.
> - Fixed potential compile issue if XHCI sideband config is not defined.
> 
> ASoC:
> - Added sound jack control into the Q6USB driver.  Allows for userpsace to know when
> an offload capable device is connected.
> 
> USB SND:
> - Avoided exporting _snd_pcm_hw_param_set based on Takashi's recommendation.
> - Split USB QMI packet header definitions into a separate commit.  This is used to
> properly allow the QMI interface driver to parse and route QMI packets accordingly
> - Added a "depends on" entry when enabling QC audio offload to avoid compile time
> issues.
> 
> Changes in v3:
> - Changed prefix from RFC to PATCH
> - Rebased entire series to usb-next
> - Updated copyright years
> 
> XHCI:
> - Rebased changes on top of XHCI changes merged into usb-next, and only added
> changes that were still under discussion.
> - Added change to read in the "num-hc-interrupters" device property.
> 
> ASoC:
> - qusb6 USB backend
>    - Incorporated suggestions to fetch iommu information with existing APIs
>    - Added two new sound kcontrols to fetch offload status and offload device
>      selection.
>      - offload status - will return the card and pcm device in use
>          tinymix -D 0 get 1 --> 1, 0 (offload in progress on card#1 pcm#0)
> 
>      - device selection - set the card and pcm device to enable offload on. Ex.:
>          tinymix -D 0 set 1 2 0  --> sets offload on card#2 pcm#0
>                                      (this should be the USB card)
> 
> USB SND:
> - Fixed up some locking related concerns for registering platform ops.
>     - Moved callbacks under the register_mutex, so that
> - Modified APIs to properly pass more information about the USB SND device, so
> that the Q6USB backend can build a device list/map, in order to monitor offload
> status and device selection.
> 
> Changes in v2:
> 
> XHCI:
> - Replaced XHCI and HCD changes with Mathias' XHCI interrupter changes
> in his tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
> 
> Adjustments made to Mathias' changes:
>    - Created xhci-intr.h to export/expose interrupter APIs versus exposing xhci.h.
>      Moved dependent structures to this file as well. (so clients can parse out
>      information from "struct xhci_interrupter")
>    - Added some basic locking when requesting interrupters.
>    - Fixed up some sanity checks.
>    - Removed clearing of the ERSTBA during freeing of the interrupter. (pending
>      issue where SMMU fault occurs if DMA addr returned is 64b - TODO)
> 
> - Clean up pending events in the XHCI secondary interrupter.  While testing USB
> bus suspend, it was seen that on bus resume, the xHCI HC would run into a command
> timeout.
> - Added offloading APIs to xHCI to fetch transfer and event ring information.
> 
> ASoC:
> - Modified soc-usb to allow for multiple USB port additions.  For this to work,
> the USB offload driver has to have a reference to the USB backend by adding
> a "usb-soc-be" DT entry to the device saved into XHCI sysdev.
> - Created separate dt-bindings for defining USB_RX port.
> - Increased APR timeout to accommodate the situation where the AFE port start
> command could be delayed due to having to issue a USB bus resume while
> handling the QMI stream start command.
> 
> USB SND:
> - Added a platform ops during usb_audio_suspend().  This allows for the USB
> offload driver to halt the audio stream when system enters PM suspend.  This
> ensures the audio DSP is not issuing transfers on the USB bus.
> - Do not override platform ops if they are already populated.
> - Introduce a shared status variable between the USB offload and USB SND layers,
> to ensure that only one path is active at a time.  If the USB bus is occupied,
> then userspace is notified that the path is busy.
> 
> Mathias Nyman (2):
>    xhci: add helper to stop endpoint and wait for completion
>    xhci: sideband: add initial api to register a sideband entity
> 
> Wesley Cheng (36):
>    usb: host: xhci: Repurpose event handler for skipping interrupter
>      events
>    usb: xhci: Allow for secondary interrupter to set IMOD
>    usb: host: xhci-mem: Cleanup pending secondary event ring events
>    usb: host: xhci-mem: Allow for interrupter clients to choose specific
>      index
>    ASoC: Add SOC USB APIs for adding an USB backend
>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>    ASoC: qdsp6: q6afe: Increase APR timeout
>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>    ALSA: usb-audio: Export USB SND APIs for modules
>    ALSA: usb-audio: Save UAC sample size information
>    usb: dwc3: Specify maximum number of XHCI interrupters
>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>    ALSA: usb-audio: qcom: Add USB QMI definitions
>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>    ALSA: usb-audio: Check for support for requested audio format
>    ASoC: usb: Add PCM format check API for USB backend
>    ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>    ALSA: usb-audio: Prevent starting of audio stream if in use
>    ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>    ALSA: usb-audio: qcom: Populate PCM and USB chip information
>    ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>    ASoC: Introduce SND kcontrols to select sound card and PCM device
>    ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>    ASoC: Introduce SND kcontrols to track USB offloading state
>    ASoC: qcom: qdsp6: Add PCM ops to track current state
>    ASoC: usb: Create SOC USB SND jack kcontrol
>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>    ASoC: usb: Fetch ASoC sound card information
>    ALSA: usb-audio: Add USB offloading capable kcontrol
>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>    ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>    ASoC: usb: Rediscover USB SND devices on USB port add
>    ASoC: doc: Add documentation for SOC USB
> 
>   .../bindings/sound/qcom,sm8250.yaml           |   15 +
>   Documentation/sound/soc/index.rst             |    1 +
>   Documentation/sound/soc/usb.rst               |  603 ++++++
>   drivers/usb/dwc3/core.c                       |   12 +
>   drivers/usb/dwc3/core.h                       |    2 +
>   drivers/usb/dwc3/host.c                       |    3 +
>   drivers/usb/host/Kconfig                      |    9 +
>   drivers/usb/host/Makefile                     |    2 +
>   drivers/usb/host/xhci-mem.c                   |   36 +-
>   drivers/usb/host/xhci-plat.c                  |    2 +
>   drivers/usb/host/xhci-ring.c                  |   50 +-
>   drivers/usb/host/xhci-sideband.c              |  418 ++++
>   drivers/usb/host/xhci.c                       |   43 +-
>   drivers/usb/host/xhci.h                       |   18 +-
>   .../sound/qcom,q6dsp-lpass-ports.h            |    1 +
>   include/linux/usb/xhci-sideband.h             |   68 +
>   include/sound/q6usboffload.h                  |   20 +
>   include/sound/soc-usb.h                       |  188 ++
>   sound/soc/Kconfig                             |   10 +
>   sound/soc/Makefile                            |    2 +
>   sound/soc/qcom/Kconfig                        |   15 +
>   sound/soc/qcom/Makefile                       |    2 +
>   sound/soc/qcom/qdsp6/Makefile                 |    1 +
>   sound/soc/qcom/qdsp6/q6afe-dai.c              |   60 +
>   sound/soc/qcom/qdsp6/q6afe.c                  |  193 +-
>   sound/soc/qcom/qdsp6/q6afe.h                  |   36 +-
>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   23 +
>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |    1 +
>   sound/soc/qcom/qdsp6/q6routing.c              |    9 +
>   sound/soc/qcom/qdsp6/q6usb.c                  |  417 ++++
>   sound/soc/qcom/sm8250.c                       |   23 +-
>   sound/soc/qcom/usb_offload_utils.c            |   55 +
>   sound/soc/qcom/usb_offload_utils.h            |   29 +
>   sound/soc/soc-usb.c                           |  684 ++++++
>   sound/usb/Kconfig                             |   25 +
>   sound/usb/Makefile                            |    2 +-
>   sound/usb/card.c                              |  109 +
>   sound/usb/card.h                              |   15 +
>   sound/usb/endpoint.c                          |    1 +
>   sound/usb/format.c                            |    1 +
>   sound/usb/helper.c                            |    1 +
>   sound/usb/pcm.c                               |  104 +-
>   sound/usb/pcm.h                               |   11 +
>   sound/usb/qcom/Makefile                       |    6 +
>   sound/usb/qcom/mixer_usb_offload.c            |   65 +
>   sound/usb/qcom/mixer_usb_offload.h            |   17 +
>   sound/usb/qcom/qc_audio_offload.c             | 1915 +++++++++++++++++
>   sound/usb/qcom/usb_audio_qmi_v01.c            |  892 ++++++++
>   sound/usb/qcom/usb_audio_qmi_v01.h            |  162 ++
>   49 files changed, 6327 insertions(+), 50 deletions(-)
>   create mode 100644 Documentation/sound/soc/usb.rst
>   create mode 100644 drivers/usb/host/xhci-sideband.c
>   create mode 100644 include/linux/usb/xhci-sideband.h
>   create mode 100644 include/sound/q6usboffload.h
>   create mode 100644 include/sound/soc-usb.h
>   create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>   create mode 100644 sound/soc/qcom/usb_offload_utils.c
>   create mode 100644 sound/soc/qcom/usb_offload_utils.h
>   create mode 100644 sound/soc/soc-usb.c
>   create mode 100644 sound/usb/qcom/Makefile
>   create mode 100644 sound/usb/qcom/mixer_usb_offload.c
>   create mode 100644 sound/usb/qcom/mixer_usb_offload.h
>   create mode 100644 sound/usb/qcom/qc_audio_offload.c
>   create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
>   create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h
> 
