Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F388D95F028
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 13:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38510207;
	Mon, 26 Aug 2024 13:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38510207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724673118;
	bh=5gF49ZsaBl+eyYEsQZFl8g7Ns5jOi2/2z9XqrrfRfmI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=td+jLwTwk+27dcFJFjDkUk05dvv/xiYnYelHoQc4kRYLE6CCV/Hvd+f5TGkqL96eZ
	 czQlJ0g1EWJpXqhb6w5qZtUrOvzdCYO42OFhDZo29I4r7LNlZf0F70fp1qwdOwzSVL
	 hcMZb93dWtDp9xFVCx4pZw7CIBP859j1BT5B5v6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048ADF805B0; Mon, 26 Aug 2024 13:51:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E52F805B0;
	Mon, 26 Aug 2024 13:51:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21CC7F80518; Mon, 26 Aug 2024 13:41:39 +0200 (CEST)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EEA0F80587
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 12:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724669019; x=1756205019;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5gF49ZsaBl+eyYEsQZFl8g7Ns5jOi2/2z9XqrrfRfmI=;
  b=jXa/uiqKbe87mfcSwikdgr6kn5vHxOUySSomjx4zbqDPMgzlXPQL7yhL
   2isq2kJZkfZKoNmoUYTTSUQxSg7CiyEtBMsqThltAarx599mM5ECY6R91
   3qhAmgfAx5nicYY2CV27D4giqpCbM8n4RxbLKt4kBR36UPz0otP9Lqsp5
   UzikPen45Brae4k4tLJZOsw1pmD4UQXlUKUVUNJB8nFy3BiRYv5haBNgk
   lvA8PgTifussYe4gWkAJu3IOMLRaRCxRfu76kE/w17+pDx0WgHSljs0gC
   wNaK8dEbAWnx1GmugiZhD0TpFYA0o111paD8mCtZEUGT8eJifxsklu3Ce
   w==;
X-CSE-ConnectionGUID: qwDRzUEUSVqA9hGnc2SwRw==
X-CSE-MsgGUID: JN7a9AvDSXCjjpMA4oyGBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25967107"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="25967107"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:33:10 -0700
X-CSE-ConnectionGUID: StgiaI9yQWW9P7hnhG707A==
X-CSE-MsgGUID: q0WWbT5FSWeCAnkmt419Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="62134701"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.121])
 ([10.245.246.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:33:03 -0700
Message-ID: <f4e609c0-92ff-4724-8243-bfe5de50d308@linux.intel.com>
Date: Mon, 26 Aug 2024 11:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 00/33] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OT6732RXJ3HWDEPIAGRJNITQ6DQZJ2F5
X-Message-ID-Hash: OT6732RXJ3HWDEPIAGRJNITQ6DQZJ2F5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OT6732RXJ3HWDEPIAGRJNITQ6DQZJ2F5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> Changelog
> --------------------------------------------
> Changes in v25:
> - Cleanups on typos mentioned within the xHCI layers
> - Modified the xHCI interrupter search if clients specify interrupter index
> - Moved mixer_usb_offload into its own module, so that other vendor offload USB
> modules can utilize it also.
> - Added support for USB audio devices that may have multiple PCM streams, as
> previous implementation only assumed a single PCM device.  SOC USB will be
> able to handle an array of PCM indexes supported by the USB audio device.
> - Added some additional checks in the QC USB offload driver to check that device
> has at least one playback stream before allowing to bind
> - Reordered DT bindings to fix the error found by Rob's bot.  The patch that
> added USB_RX was after the example was updated.
> - Updated comments within SOC USB to clarify terminology and to keep it consistent
> - Added SND_USB_JACK type for notifying of USB device audio connections

I went through the code and didn't find anything that looked like a
major blocker. There are still a number of cosmetic things you'd want to
fix such as using checkpatch.pl --strict --codespell to look for obvious
style issues and typos, see selection below. git am also complains about
EOF lines.

Overall this is starting to look good and ready for other reviewers to
look at.



WARNING: 'reaquire' may be misspelled - perhaps 'reacquire'?
#54: FILE: drivers/usb/host/xhci-ring.c:3037:
+ * for non OS owned interrupter event ring. It may drop and reaquire
xhci->lock
                                                             ^^^^^^^^
WARNING: 'compliation' may be misspelled - perhaps 'compilation'?
#16:
module compliation added by Wesley Cheng to complete original concept code
       ^^^^^^^^^^^
CHECK: Prefer kzalloc(sizeof(*sgt)...) over kzalloc(sizeof(struct
sg_table)...)
#105: FILE: drivers/usb/host/xhci-sideband.c:35:
+	sgt = kzalloc(sizeof(struct sg_table), GFP_KERNEL);

CHECK: struct mutex definition without comment
#557: FILE: include/linux/usb/xhci-sideband.h:35:
+	struct mutex			mutex;

WARNING: 'straightfoward' may be misspelled - perhaps 'straightforward'?
#22:
straightfoward, as the ASoC components have direct references to the ASoC
^^^^^^^^^^^^^^
CHECK: Unnecessary parentheses around 'card == sdev->card_idx'
#142: FILE: sound/soc/qcom/qdsp6/q6usb.c:217:
+	if ((card == sdev->card_idx) &&
+		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {

CHECK: Unnecessary parentheses around 'pcm ==
sdev->ppcm_idx[sdev->num_playback - 1]'
#142: FILE: sound/soc/qcom/qdsp6/q6usb.c:217:
+	if ((card == sdev->card_idx) &&
+		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {

WARNING: 'seqeunces' may be misspelled - perhaps 'sequences'?
#8:
seqeunces.  This allows for platform USB SND modules to properly initialize
^^^^^^^^^

WARNING: 'exisiting' may be misspelled - perhaps 'existing'?
#12:
exisiting parameters.
^^^^^^^^^

CHECK: Please use a blank line after function/struct/union/enum declarations
#1020: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:98:
+};
+#define QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN 46

CHECK: Please use a blank line after function/struct/union/enum declarations
#1054: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:132:
+};
+#define QMI_UAUDIO_STREAM_RESP_MSG_V01_MAX_MSG_LEN 202

CHECK: Please use a blank line after function/struct/union/enum declarations
#1081: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:159:
+};
+#define QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN 181

CHECK: Macro argument 'n' may be better as '(n)' to avoid precedence issues
#100: FILE: sound/usb/mixer_usb_offload.c:19:
+#define PCM_IDX(n)  (n & 0xffff)

CHECK: Macro argument 'n' may be better as '(n)' to avoid precedence issues
#101: FILE: sound/usb/mixer_usb_offload.c:20:
+#define CARD_IDX(n) (n >> 16)

