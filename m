Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F56693A5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 11:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C12A60A;
	Fri, 13 Jan 2023 11:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C12A60A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673604356;
	bh=visOqDfGyrGZZhLY3aBWVf+JPzFkbi3Wr7mTO+gZTI0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MHgxJROvewhy8G3XbdY/e9O9ghI/6AAIDy9JH3gTbNpU++LYQmmpjBdTmZ3/Ya2rk
	 2/al6I4sHpl7SUvSTpXhmmUHuzrwAv9J+IDCgGrRfVNSSIQ3Y6zSLkeLTbinxCskw0
	 C5ixx8b3/4zRENBRhTlstbi+FGWCzwf8zEUFy1cI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57611F8030F;
	Fri, 13 Jan 2023 11:04:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CB4F8026D; Fri, 13 Jan 2023 11:04:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA33F802E8
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 11:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA33F802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YwuwFT30
Received: by mail-wm1-x32b.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso11902277wms.4
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 02:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8NUCMuYbymx8u5btDVD+N91T8RFFIAXiDfuzelNpPD0=;
 b=YwuwFT30rA4Uzc48l3kg627KqF4f+ijzT5WVwwLaY3J8PtHa2E2re8CZ/Ko7q1wasW
 zgtFYuUYE5OjuN4HeffsmkdvcUxCEVE/wp22fAx+JO7tE698vuUmEszaKTdSftklM++p
 34eYQzblo1t3NOybfdka89/72r1DCff5bGVzzCjTN6NS57k+E6Dd0SqpxL6iHBWxrQM9
 dNCUsDTZ+JUhXNsJXZBdpIz4DAL+0zG19SgI5WfRRI4L4IsM2A3EZjztd5khSittWEX/
 kIb3IAa1y7hovJw8idyt8JnE42l62ViUvXHwvbYychiSyN+RIqsy2USFlues/BQ2+Ar5
 uTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8NUCMuYbymx8u5btDVD+N91T8RFFIAXiDfuzelNpPD0=;
 b=w5rBGw9M8ETKxX1k+WL4oX85o9VIAmdNCiJm2qa0aVkUIeJqT34vO7HyFqFm/P6pXZ
 eA1BsENDOPTx0jRPGvo4FwrHNcka6qWXUEirTFTMTv0Q2Q7ZtLV3lQIe52sz3zvv4XEo
 z2fys2qnCSDrKX2c1TRm+7ksOKixWIttx45hqF5M8CO64QQlMd7pkVSlSxd5fZzTPcxX
 p9l1YqXFvPmazopnjU/lUL1AJNKRPA574r3xBN+hcpnZo5tLpucY1xPR7PktspZlKXEL
 cpxKyXyHXKOHG6YbUeE5aGNAX+vnlL2DhLA9Ui0oknu6eZPuD7FIXI9MU7dZmKi0TwAd
 jHaw==
X-Gm-Message-State: AFqh2koF/balpryWFZ03/uG/B2PGAXqlb33Idy8hShtACKS8fr9nRHem
 ahN7WMzFMMH12S30FiLln9gaupIO4dfSAA==
X-Google-Smtp-Source: AMrXdXuYwFhQsuh2YN2TfFnPe4MkYYmJ+0nWMU12lOpcVMmZdmx/S1qcVKn2JmeTlYPXrqh07vMe/w==
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr61128443wms.9.1673604289537; 
 Fri, 13 Jan 2023 02:04:49 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 k5-20020adfd845000000b002bdd96d88b4sm3026553wrl.75.2023.01.13.02.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:04:49 -0800 (PST)
Date: Fri, 13 Jan 2023 13:04:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: o-takashi@sakamocchi.jp
Subject: [bug report] ALSA: firewire-lib: extend tracepoints event including
 CYCLE_TIME of 1394 OHCI
Message-ID: <Y8Ess7+7NxnSDX2o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Takashi Sakamoto,

The patch fef4e61b0b76: "ALSA: firewire-lib: extend tracepoints event
including CYCLE_TIME of 1394 OHCI" from Jan 10, 2023, leads to the
following Smatch static checker warning:

sound/firewire/amdtp-stream.c:944 generate_tx_packet_descs() error: uninitialized symbol 'curr_cycle_time'.
sound/firewire/amdtp-stream.c:1099 process_rx_packets()	error: uninitialized symbol 'curr_cycle_time'.

sound/firewire/amdtp-stream.c
    1047 static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
    1048                                void *header, void *private_data)
    1049 {
    1050         struct amdtp_stream *s = private_data;
    1051         const struct amdtp_domain *d = s->domain;
    1052         const __be32 *ctx_header = header;
    1053         const unsigned int events_per_period = d->events_per_period;
    1054         unsigned int event_count = s->ctx_data.rx.event_count;
    1055         struct pkt_desc *desc = s->packet_descs_cursor;
    1056         unsigned int pkt_header_length;
    1057         unsigned int packets;
    1058         u32 curr_cycle_time;
                 ^^^^^^^^^^^^^^^^^^^

    1059         bool need_hw_irq;
    1060         int i;
    1061 
    1062         if (s->packet_index < 0)
    1063                 return;
    1064 
    1065         // Calculate the number of packets in buffer and check XRUN.
    1066         packets = header_length / sizeof(*ctx_header);
    1067 
    1068         generate_rx_packet_descs(s, desc, ctx_header, packets);
    1069 
    1070         process_ctx_payloads(s, desc, packets);
    1071 
    1072         if (!(s->flags & CIP_NO_HEADER))
    1073                 pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
    1074         else
    1075                 pkt_header_length = 0;
    1076 
    1077         if (s == d->irq_target) {
    1078                 // At NO_PERIOD_WAKEUP mode, the packets for all IT/IR contexts are processed by
    1079                 // the tasks of user process operating ALSA PCM character device by calling ioctl(2)
    1080                 // with some requests, instead of scheduled hardware IRQ of an IT context.
    1081                 struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
    1082                 need_hw_irq = !pcm || !pcm->runtime->no_period_wakeup;
    1083         } else {
    1084                 need_hw_irq = false;
    1085         }
    1086 
    1087         if (trace_amdtp_packet_enabled())
    1088                 (void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);

No error checking and no else path.

    1089 
    1090         for (i = 0; i < packets; ++i) {
    1091                 struct {
    1092                         struct fw_iso_packet params;
    1093                         __be32 header[CIP_HEADER_QUADLETS];
    1094                 } template = { {0}, {0} };
    1095                 bool sched_irq = false;
    1096 
    1097                 build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
    1098                                     desc->data_blocks, desc->data_block_counter,
--> 1099                                     desc->syt, i, curr_cycle_time);
                                                           ^^^^^^^^^^^^^^^
Uninitialized.

    1100 
    1101                 if (s == s->domain->irq_target) {
    1102                         event_count += desc->data_blocks;
    1103                         if (event_count >= events_per_period) {
    1104                                 event_count -= events_per_period;
    1105                                 sched_irq = need_hw_irq;
    1106                         }
    1107                 }
    1108 
    1109                 if (queue_out_packet(s, &template.params, sched_irq) < 0) {
    1110                         cancel_stream(s);
    1111                         return;
    1112                 }
    1113 
    1114                 desc = amdtp_stream_next_packet_desc(s, desc);
    1115         }
    1116 
    1117         s->ctx_data.rx.event_count = event_count;
    1118         s->packet_descs_cursor = desc;
    1119 }

regards,
dan carpenter
