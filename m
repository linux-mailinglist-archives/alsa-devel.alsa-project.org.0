Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8046697D5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 13:58:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3D98B61;
	Fri, 13 Jan 2023 13:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3D98B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673614716;
	bh=oiHpT49FZMeDhyy5tCEAHFZn3jNJAo2cCdZ+MQ0/5K0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uIx7g6sIUYVfY2IJp51NNKfLiQKlsjwpJtpQIOtSzeyCe7lvsqE7c7tI0UrN5qE2S
	 N2ztYhAb22avN3ziQfxY2J8ZNUNZupcsviUuzo/yIq7muoyY9TgGWTJbpSxDMmJSCa
	 pdxYGkrngTe8926Eg/g78rjoqi7cUkrHz6T8M+nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A875BF802E8;
	Fri, 13 Jan 2023 13:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E958AF8030F; Fri, 13 Jan 2023 13:57:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FED7F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FED7F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=NlxkeIoi; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=fW0nTRAV
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2C73632000F9;
 Fri, 13 Jan 2023 07:57:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 13 Jan 2023 07:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1673614647; x=1673701047; bh=NS
 /nkY5uEmJ+Jf4wo05iM0/KfcpFX1y/N4BqUqovT0g=; b=NlxkeIoi1dCf40P1du
 VSDmZn41Sgk22p65bVDN0mwq/dBHALWAP40OJEzWECVHWccBHn7r2FarOSP6+SMS
 HyDi63Ak7tW4gcP0KoSMxzq9Sma0aXGCVPgL5Xwgg1omp9f2R1rrrJDfr+C83F3P
 vsy477v9DAJfuxHUKhzZHbSlz3ijUo9VH3ds+ZDR8BtmyDq2oOmCoCvOs37EVGg+
 YaK5HdB5Pw4JRrJWjhpmcP1KklwoSCAucBd1WWE1GatWJnoPYuL0g57sfNaA2Ygc
 7wtZKbLbQW5ZKSHLg0MtdyuDlmxECApKMV0ATcKVZUpWMuyLVFJ1D85GsAKdynKy
 KWtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673614647; x=1673701047; bh=NS/nkY5uEmJ+Jf4wo05iM0/KfcpF
 X1y/N4BqUqovT0g=; b=fW0nTRAVn3RNhcT7u1ePxTneqOSHBKCnzShvjl4lVb80
 nRpAuthLzPXdEZG4ba3N6xt+nj53RIvNXHeR95+IwEnNoHpJYZaWPIhczkhN8kbO
 00Tgc6sF2KWLMbVPFQOn7gMOU2H+WReds+P6pt2vR/vfgE5cjXX/N1CXsaTVUOeJ
 Gx+wNmG2iLdZUUdMmi6wSr4L/bygpFalmJRt/5BnRb7n14F+92bAenHknPgldItW
 C5I8iVb9GdQypzOLytOESBASDP9T/GawCgo/s5gGJFVXcltya/k0kBVx2x/q+Wd1
 5CICZx68iy+k7xc+JGlZH2deXZ+H0q1j8CVjhyexww==
X-ME-Sender: <xms:N1XBY47P_AIIz6jv3b_J2r4P3_pGd2eIzAMqHOjCK2YLMW91HvNIlg>
 <xme:N1XBY54P_CrsPdyWJjhugXtFLVDuqBgMLUv09ejaWsRQ_jVmmi4RwBcUXxqzbms0R
 -lPWy4ZksKwUB7VkRg>
X-ME-Received: <xmr:N1XBY3fyYiSVmIPjB0yj9uJWX1KV0MSRCHcH3d0-_nxITyPjZ-9mDRnkXkhKwBeTCUbwSWH3UklllclaVrYKk4ZuXOG1FbLRU0yy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephefhhfette
 fgkedvieeuffevveeufedtlefhjeeiieetvdelfedtgfefuedukeeunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:N1XBY9KSj2Dwvnn38gMjj0JHz4e2WUIySVYecncOsoBEeYztQfNKOA>
 <xmx:N1XBY8Lz5cxkSYoSXFCipIModz379KiVkWqC5zX_q_ahcpuKNgqePg>
 <xmx:N1XBY-yxp0qOyhuxEOSCmR5iK5tpWx5CISZMgqIHAcLpPEdKmvW76w>
 <xmx:N1XBY2xH2UEmZVGJ37I9UlRL36dEHCeUB2nFPeOqkiHghRgA_FPlLA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 07:57:26 -0500 (EST)
Date: Fri, 13 Jan 2023 21:57:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [bug report] ALSA: firewire-lib: extend tracepoints event
 including CYCLE_TIME of 1394 OHCI
Message-ID: <Y8FVM7AU6tpKoXRx@workstation>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>,
 alsa-devel@alsa-project.org
References: <Y8Ess7+7NxnSDX2o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Ess7+7NxnSDX2o@kili>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Fri, Jan 13, 2023 at 01:04:35PM +0300, Dan Carpenter wrote:
> Hello Takashi Sakamoto,
> 
> The patch fef4e61b0b76: "ALSA: firewire-lib: extend tracepoints event
> including CYCLE_TIME of 1394 OHCI" from Jan 10, 2023, leads to the
> following Smatch static checker warning:
> 
> sound/firewire/amdtp-stream.c:944 generate_tx_packet_descs() error: uninitialized symbol 'curr_cycle_time'.
> sound/firewire/amdtp-stream.c:1099 process_rx_packets()	error: uninitialized symbol 'curr_cycle_time'.

Thanks for the report. Indeed, I've absolutely overlooked it. I'll fix
it enough later with an issue in your previous report for ALSA
firewire-motu driver.

Actually, the value of local variable is referred only when tracepoints
event is probed, thus the uninitialized bug never occurs. Nevertheless,
in a point of coding convention, it's preferable to be initialized.

> sound/firewire/amdtp-stream.c
>     1047 static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
>     1048                                void *header, void *private_data)
>     1049 {
>     1050         struct amdtp_stream *s = private_data;
>     1051         const struct amdtp_domain *d = s->domain;
>     1052         const __be32 *ctx_header = header;
>     1053         const unsigned int events_per_period = d->events_per_period;
>     1054         unsigned int event_count = s->ctx_data.rx.event_count;
>     1055         struct pkt_desc *desc = s->packet_descs_cursor;
>     1056         unsigned int pkt_header_length;
>     1057         unsigned int packets;
>     1058         u32 curr_cycle_time;
>                  ^^^^^^^^^^^^^^^^^^^
> 
>     1059         bool need_hw_irq;
>     1060         int i;
>     1061 
>     1062         if (s->packet_index < 0)
>     1063                 return;
>     1064 
>     1065         // Calculate the number of packets in buffer and check XRUN.
>     1066         packets = header_length / sizeof(*ctx_header);
>     1067 
>     1068         generate_rx_packet_descs(s, desc, ctx_header, packets);
>     1069 
>     1070         process_ctx_payloads(s, desc, packets);
>     1071 
>     1072         if (!(s->flags & CIP_NO_HEADER))
>     1073                 pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
>     1074         else
>     1075                 pkt_header_length = 0;
>     1076 
>     1077         if (s == d->irq_target) {
>     1078                 // At NO_PERIOD_WAKEUP mode, the packets for all IT/IR contexts are processed by
>     1079                 // the tasks of user process operating ALSA PCM character device by calling ioctl(2)
>     1080                 // with some requests, instead of scheduled hardware IRQ of an IT context.
>     1081                 struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
>     1082                 need_hw_irq = !pcm || !pcm->runtime->no_period_wakeup;
>     1083         } else {
>     1084                 need_hw_irq = false;
>     1085         }
>     1086 
>     1087         if (trace_amdtp_packet_enabled())
>     1088                 (void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
> 
> No error checking and no else path.
> 
>     1089 
>     1090         for (i = 0; i < packets; ++i) {
>     1091                 struct {
>     1092                         struct fw_iso_packet params;
>     1093                         __be32 header[CIP_HEADER_QUADLETS];
>     1094                 } template = { {0}, {0} };
>     1095                 bool sched_irq = false;
>     1096 
>     1097                 build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
>     1098                                     desc->data_blocks, desc->data_block_counter,
> --> 1099                                     desc->syt, i, curr_cycle_time);
>                                                            ^^^^^^^^^^^^^^^
> Uninitialized.
> 
>     1100 
>     1101                 if (s == s->domain->irq_target) {
>     1102                         event_count += desc->data_blocks;
>     1103                         if (event_count >= events_per_period) {
>     1104                                 event_count -= events_per_period;
>     1105                                 sched_irq = need_hw_irq;
>     1106                         }
>     1107                 }
>     1108 
>     1109                 if (queue_out_packet(s, &template.params, sched_irq) < 0) {
>     1110                         cancel_stream(s);
>     1111                         return;
>     1112                 }
>     1113 
>     1114                 desc = amdtp_stream_next_packet_desc(s, desc);
>     1115         }
>     1116 
>     1117         s->ctx_data.rx.event_count = event_count;
>     1118         s->packet_descs_cursor = desc;
>     1119 }
> 
> regards,
> dan carpenter


Regards

Takashi Sakamoto
