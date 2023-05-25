Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 901AB7125D0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4B420C;
	Fri, 26 May 2023 13:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4B420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101546;
	bh=uy2X5Z40hq/R5oiaHonCPT/2AeiQtfHkp6Sqiv7j4lg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JvILcyUQB22Qg82KyFGz8Ln3bMsBNIZGhYy3N4w1YoTF7Hos3CkNAYeqpYUGpmgwO
	 Ca8AZYXN3AtryMt6JD+aaF4LoHpf2HZ6uKDWpeMoQw5TkMA3IZQ0bpkcAPoGnjefiK
	 3nJdnEG2++UPVgYIgczx3SpqUiL1dcVuiDpquyEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CCA0F80568; Fri, 26 May 2023 13:43:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1F1F80552;
	Fri, 26 May 2023 13:43:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49858F80249; Thu, 25 May 2023 09:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE88DF80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 09:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE88DF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=E5osnogk
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f6dbe3c230so1159755e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 00:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685001472; x=1687593472;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeqJNrx2mD+Uv30IIshMv9Clnpbjsn0l7MPTidnFEkE=;
        b=E5osnogk+gPq5a1xSZyugZ1dKNKffHaESG09sNYz6OYCtzt6Dfr6YjKVczhOBWBZeu
         ANorfjovdE6rE7PjH5J8GPf/OJ1ItQK334dsvsY0Bh0nbFfGCRpK5fs/50rhkHXOrtLB
         783X46KRylCU11YD+amhrOh8550MJzDjgzLjptsVMUXnJzXBlRq0TxQsijavJQfsZBbA
         SQUHe142ytZx11NorzxAdJup2qzAEVNkr9ZkfaCemrpMWyAK967+2dWZV80NWX+8Vfl5
         Iynbt4o6sFXtjd+DeI9HpAxfXd6aOUoGtPCAHkka1ePgV77dFmUx/ih5jHbxiyMnOm8T
         jctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685001472; x=1687593472;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeqJNrx2mD+Uv30IIshMv9Clnpbjsn0l7MPTidnFEkE=;
        b=EzoZIOviCAVsppVA86QFFODGgEZp22GWT9JJcpWiPiyqhsLMCn/IEOo9rRYNKYKuNH
         8TS5C10MDOL0J/XlLVSmqU+t9u7gpQewHBahfF05XeirGqTb/VW6fKZL3PbufEP8fV/H
         uU/Vn0DayFE9hDYxI+6CEH6AzZ2iBD0rzhQa2nXqxVO26jSEJGxLuEeb/bn77MWYehsi
         GwX8o3DZhxrVDY+tT86XOFmunTaxgpYvUIopCeHdAcqkWSNMO0dkmYI1sdSHWANrkETF
         qStOiCZBrj9tgtmZQBzI3/8y9LiyGN9GRSfOcn64UR4pf136SGAHxnWLsF+0jitIqWz2
         5plg==
X-Gm-Message-State: AC+VfDzvD+bjXgILS5vpRpWVExUdkqzirWScQEmkteeGk/WbHWKf70CB
	tdnPxPQslbOZsO+RB6n/sNffLw==
X-Google-Smtp-Source: 
 ACHHUZ41vTWE5rO+q9J1ZZCrIJ8zGL31kQVZj6LEwCJOEL+LlTkjq8ENEqh3j7wY5lBj0eViK8plZw==
X-Received: by 2002:a05:600c:2199:b0:3f6:735:69e7 with SMTP id
 e25-20020a05600c219900b003f6073569e7mr1755633wme.36.1685001472112;
        Thu, 25 May 2023 00:57:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 h2-20020adff4c2000000b0030631f199f9sm885502wrp.34.2023.05.25.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 00:57:50 -0700 (PDT)
Date: Thu, 25 May 2023 10:57:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ALSA: ump: Add legacy raw MIDI support
Message-ID: <4683198a-84f6-4238-9e87-c70667d84523@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IPQTMIAZPQL3IHCLZ2XDTRNMDEOF3N2S
X-Message-ID-Hash: IPQTMIAZPQL3IHCLZ2XDTRNMDEOF3N2S
X-Mailman-Approved-At: Fri, 26 May 2023 11:43:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPQTMIAZPQL3IHCLZ2XDTRNMDEOF3N2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Takashi Iwai,

The patch 0b5288f5fe63: "ALSA: ump: Add legacy raw MIDI support" from
May 23, 2023, leads to the following Smatch static checker warning:

	sound/core/ump_convert.c:343 cvt_legacy_cmd_to_ump()
	warn: duplicate check 'buf[2]' (previous on line 333)

sound/core/ump_convert.c
    305 static int cvt_legacy_cmd_to_ump(struct snd_ump_endpoint *ump,
    306                                  struct ump_cvt_to_ump *cvt,
    307                                  unsigned char group, u32 *data,
    308                                  unsigned char bytes)
    309 {
    310         const unsigned char *buf = cvt->buf;
    311         struct ump_cvt_to_ump_bank *cc;
    312         union snd_ump_midi2_msg *midi2 = (union snd_ump_midi2_msg *)data;
    313         unsigned char status, channel;
    314 
    315         BUILD_BUG_ON(sizeof(union snd_ump_midi1_msg) != 4);
    316         BUILD_BUG_ON(sizeof(union snd_ump_midi2_msg) != 8);
    317 
    318         /* for MIDI 1.0 UMP, it's easy, just pack it into UMP */
    319         if (ump->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI1) {
    320                 data[0] = ump_compose(UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE,
    321                                       group, 0, buf[0]);
    322                 data[0] |= buf[1] << 8;
    323                 if (bytes > 2)
    324                         data[0] |= buf[2];
    325                 return 4;
    326         }
    327 
    328         status = *buf >> 4;
    329         channel = *buf & 0x0f;
    330         cc = &cvt->bank[channel];
    331 
    332         /* special handling: treat note-on with 0 velocity as note-off */
    333         if (status == UMP_MSG_STATUS_NOTE_ON && !buf[2])
    334                 status = UMP_MSG_STATUS_NOTE_OFF;

This if statment

    335 
    336         /* initialize the packet */
    337         data[0] = ump_compose(UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE,
    338                               group, status, channel);
    339         data[1] = 0;
    340 
    341         switch (status) {
    342         case UMP_MSG_STATUS_NOTE_ON:
--> 343                 if (!buf[2])
    344                         status = UMP_MSG_STATUS_NOTE_OFF;

and this one are the same.  One could be deleted.

    345                 fallthrough;
    346         case UMP_MSG_STATUS_NOTE_OFF:
    347                 midi2->note.note = buf[1];
    348                 midi2->note.velocity = upscale_7_to_16bit(buf[2]);
    349                 break;
    350         case UMP_MSG_STATUS_POLY_PRESSURE:
    351                 midi2->paf.note = buf[1];
    352                 midi2->paf.data = upscale_7_to_32bit(buf[2]);
    353                 break;
    354         case UMP_MSG_STATUS_CC:
    355                 switch (buf[1]) {
    356                 case UMP_CC_RPN_MSB:
    357                         cc->rpn_set = 1;
    358                         cc->cc_rpn_msb = buf[2];
    359                         return 0; // skip
    360                 case UMP_CC_RPN_LSB:
    361                         cc->rpn_set = 1;
    362                         cc->cc_rpn_lsb = buf[2];
    363                         return 0; // skip
    364                 case UMP_CC_NRPN_MSB:
    365                         cc->nrpn_set = 1;
    366                         cc->cc_nrpn_msb = buf[2];
    367                         return 0; // skip
    368                 case UMP_CC_NRPN_LSB:
    369                         cc->nrpn_set = 1;
    370                         cc->cc_nrpn_lsb = buf[2];
    371                         return 0; // skip
    372                 case UMP_CC_DATA:
    373                         cc->cc_data_msb = buf[2];
    374                         return 0; // skip
    375                 case UMP_CC_BANK_SELECT:
    376                         cc->bank_set = 1;
    377                         cc->cc_bank_msb = buf[2];
    378                         return 0; // skip
    379                 case UMP_CC_BANK_SELECT_LSB:
    380                         cc->bank_set = 1;
    381                         cc->cc_bank_lsb = buf[2];
    382                         return 0; // skip
    383                 case UMP_CC_DATA_LSB:
    384                         cc->cc_data_lsb = buf[2];
    385                         if (cc->rpn_set || cc->nrpn_set)
    386                                 fill_rpn(cc, midi2);
    387                         else
    388                                 return 0; // skip
    389                         break;
    390                 default:
    391                         midi2->cc.index = buf[1];
    392                         midi2->cc.data = upscale_7_to_32bit(buf[2]);
    393                         break;
    394                 }
    395                 break;
    396         case UMP_MSG_STATUS_PROGRAM:
    397                 midi2->pg.program = buf[1];
    398                 if (cc->bank_set) {
    399                         midi2->pg.bank_valid = 1;
    400                         midi2->pg.bank_msb = cc->cc_bank_msb;
    401                         midi2->pg.bank_lsb = cc->cc_bank_lsb;
    402                         cc->bank_set = 0;
    403                         cc->cc_bank_msb = cc->cc_bank_lsb = 0;
    404                 }
    405                 break;
    406         case UMP_MSG_STATUS_CHANNEL_PRESSURE:
    407                 midi2->caf.data = upscale_7_to_32bit(buf[1]);
    408                 break;
    409         case UMP_MSG_STATUS_PITCH_BEND:
    410                 midi2->pb.data = upscale_14_to_32bit(buf[1] | (buf[2] << 7));
    411                 break;
    412         default:
    413                 return 0;
    414         }
    415 
    416         return 8;
    417 }

regards,
dan carpenter
