Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD841E0ABA
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB9D1733;
	Mon, 25 May 2020 11:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB9D1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590399416;
	bh=pFJrhJ7RzVkr+9AEcKvzZE6fPi6O/1/sB6LNMKbqTl8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHEsKyzOvHdg7Zjbb9dX+Du6jwB/lRJHLE7rv2+Nt4NO9OPwPZxCGQkWYAqAbNaY4
	 AEf1+a5kcgmjg1HFVshXPsxZkm0Rf8Mc/iE8F7EHkR1orJRkFPk+OpmrDbo/iEBd/T
	 bkuyCaE/jv79tsw4JVI+lSfzWhtb/fredeT1PEgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB57F8021E;
	Mon, 25 May 2020 11:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC67F8016F; Mon, 25 May 2020 11:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 435B9F8014A
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 11:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 435B9F8014A
IronPort-SDR: xd5aXZ5B4bksZk7zWM5BklFLWF6eDP1lP/bIrAvctky1S5FafBWBFuK1BDfcnakU91iziWpQy4
 uqpmAsZC0uug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 02:35:05 -0700
IronPort-SDR: s2mRJViqRijEz4iKeHkFIfGs6U+YlRRVdTfMczX/TID3cqD7FFW3MgoomPPC8WN7rVetaoSZf0
 voNBsL3Zu9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="467914372"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170])
 ([10.237.72.170])
 by fmsmga005.fm.intel.com with ESMTP; 25 May 2020 02:35:03 -0700
Subject: Re: XHCI vs PCM2903B/PCM2904 part 2
To: Rik van Riel <riel@surriel.com>, Alan Stern <stern@rowland.harvard.edu>
References: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
 <20200520163840.GA11084@rowland.harvard.edu>
 <667d8d156fa5d8420ef1c3b1d08b94a10d2398cc.camel@surriel.com>
 <20200520203417.GA23602@rowland.harvard.edu>
 <d75c3a3cda51149a054838652243de2b8ac20854.camel@surriel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <059878e7-75b8-e033-ec9f-7e6b73df8f78@linux.intel.com>
Date: Mon, 25 May 2020 12:37:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d75c3a3cda51149a054838652243de2b8ac20854.camel@surriel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

On 21.5.2020 6.45, Rik van Riel wrote:
> On Wed, 2020-05-20 at 16:34 -0400, Alan Stern wrote:
>> On Wed, May 20, 2020 at 03:21:44PM -0400, Rik van Riel wrote:
>>>
>>> Interesting. That makes me really curious why things are
>>> getting stuck, now...
>>
>> This could be a bug in xhci-hcd.  Perhaps the controller's endpoint 
>> state needs to be updated after one of these errors occurs.  Mathias 
>> will know all about that.
> 
> I am seeing something potentially interesting in the
> giant trace. First the final enqueue/dequeue before
> the babble error:
> 
>           <idle>-0     [005] d.s. 776367.638233: xhci_inc_enq: ISOC
> 0000000033a6879e: enq 0x0000001014070420(0x0000001014070000) deq
> 0x0000001014070360(0x0000001014070000) segs 2 stream 0 free_trbs 497
> bounce 196 cycle 1
> 
> The next reference to 0x0000001014070360 is the babble error,
> and some info on the ISOC buffer itself:
> 
>           <idle>-0     [005] d.h. 776367.639187: xhci_handle_event:
> EVENT: TRB 0000001014070360 status 'Babble Detected' len 196 slot 15 ep
> 9 type 'Transfer Event' flags e:C
>           <idle>-0     [005] d.h. 776367.639195: xhci_handle_transfer:
> ISOC: Buffer 0000000e2676f400 length 196 TD size 0 intr 0 type 'Isoch'
> flags b:i:I:c:s:I:e:C
>n
> Immediately after the babble error, the next request is enqueued,
> and the doorbell is rung:
> 
>           <idle>-0     [005] d.h. 776367.639196: xhci_inc_deq: ISOC 0000000033a6879e: enq 0x0000001014070420(0x0000001014070000) deq 0x0000001014070370(0x0000001014070000) segs 2 stream 0 free_trbs 498 bounce 196 cycle 1
>           <idle>-0     [005] d.h. 776367.639197: xhci_urb_giveback: ep4in-isoc: urb 0000000072126553 pipe 135040 slot 15 length 196/196 sgs 0/0 stream 0 flags 00000206
>           <idle>-0     [005] d.h. 776367.639197: xhci_inc_deq: EVENT 0000000097f84b16: enq 0x00000010170b5000(0x00000010170b5000) deq 0x00000010170b5670(0x00000010170b5000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
>           <idle>-0     [005] ..s. 776367.639212: xhci_urb_enqueue: ep4in-isoc: urb 0000000072126553 pipe 135040 slot 15 length 0/196 sgs 0/0 stream 0 flags 00000206
>           <idle>-0     [005] d.s. 776367.639214: xhci_queue_trb: ISOC: Buffer 0000000e2676f400 length 196 TD size 0 intr 0 type 'Isoch' flags b:i:I:c:s:I:e:c
>           <idle>-0     [005] d.s. 776367.639214: xhci_inc_enq: ISOC 0000000033a6879e: enq 0x0000001014070430(0x0000001014070000) deq 0x0000001014070370(0x0000001014070000) segs 2 stream 0 free_trbs 497 bounce 196 cycle 1
>           <idle>-0     [005] d.s. 776367.639215: xhci_ring_ep_doorbell: Ring doorbell for Slot 15 ep4in
> 
> However, after that point, no more xhci_handle_transfer: ISOC
> lines ar seen in the log. The doorbell line above is the last
> line in the log for ep4in.
> 
> Is this some area where USB3 and USB2 behave differently?

It acts as if the endpoint is no longer running.

If the endpoint would be halted then xhci_requires_manual_halt_cleanup() should
reset the endpoints and it would show in the traces.

Could you add the code below and take new traces, it will show the endpoint
state after the Babble error.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0fda0c0f4d31..373d89ef7275 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2455,6 +2455,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	case COMP_BABBLE_DETECTED_ERROR:
 		xhci_dbg(xhci, "Babble error for slot %u ep %u on endpoint\n",
 			 slot_id, ep_index);
+		trace_xhci_handle_tx_event(ep_ctx);
 		status = -EOVERFLOW;
 		break;
 	/* Completion codes for endpoint error state */
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index b19582b2a72c..5081df079f4a 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -360,6 +360,11 @@ DEFINE_EVENT(xhci_log_ep_ctx, xhci_add_endpoint,
 	TP_ARGS(ctx)
 );
 
+DEFINE_EVENT(xhci_log_ep_ctx, xhci_handle_tx_event,
+	TP_PROTO(struct xhci_ep_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_slot_ctx,
 	TP_PROTO(struct xhci_slot_ctx *ctx),
 	TP_ARGS(ctx),


