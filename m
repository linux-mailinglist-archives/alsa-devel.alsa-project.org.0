Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76EAD42ED
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 21:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4878060208;
	Tue, 10 Jun 2025 21:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4878060208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749584036;
	bh=KSeNiuI2WNIB+t6QrITro5mWCBu4t6QDGDK3SYd5g+Q=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ASCsMD0O+mq4QexqSiYO7pqx6oU862UcEKG19KVRUSMpE6HXIo4g6D9D4+g9lmOQR
	 rnKZLWFPf4IW+exyOxCT2J+gg1DG5nmbT3GvNgTukYAlrBWDROCiP+nmBuWUEwcAna
	 glXYCCKB9L1kGq6payRZ4sCivSd6EE419kv8QNG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C8DEF805EE; Tue, 10 Jun 2025 21:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4F5F805E7;
	Tue, 10 Jun 2025 21:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C633CF800F0; Fri,  6 Jun 2025 08:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0499DF8003A
	for <alsa-devel@alsa-project.org>; Fri,  6 Jun 2025 08:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0499DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=YhRTTcW4
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5566q914099329;
	Fri, 6 Jun 2025 01:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749192729;
	bh=og/gl5zYHpQyXqgpNuAYS8lcX2+5P2VicQXqfIsywLA=;
	h=From:To:CC:Subject:Date;
	b=YhRTTcW4BiJf/4zgDYATWQg0tKtoUQTBlS6xuFUj8ghC5RVJAdggUcHbxigywXIbp
	 wZgqYGaE6HYHhtJ5umFYACEv/TmGEbwPI7piuEmh8S7Vqv0gi0y5IJJQno635qDbBl
	 jV2z/nAoc4sljBD3h+Cmt7l0t4MlEALfLkqvcsw4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5566q9e81482885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 6 Jun 2025 01:52:09 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Jun 2025 01:52:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Jun 2025 01:52:08 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com
 [172.24.149.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5566q4Od677113;
	Fri, 6 Jun 2025 01:52:05 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>, <navada@ti.com>,
        <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v1 0/4] ASoc: tac5x1x: mixer-test report
Date: Fri, 6 Jun 2025 12:21:32 +0530
Message-ID: <20250606065136.1821-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D5EYBTVAHVKONPHXYAIUUPOZGU3T3MTY
X-Message-ID-Hash: D5EYBTVAHVKONPHXYAIUUPOZGU3T3MTY
X-Mailman-Approved-At: Tue, 10 Jun 2025 19:33:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5EYBTVAHVKONPHXYAIUUPOZGU3T3MTY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

mixer-test report:
  TAP version 13
  # Card 0/titac5x1xsoundc - ti,tac5x1x-soundcard (ti,tac5x1x-soundcard)
  1..679
  ok 1 get_value.titac5x1xsoundc.96
  # titac5x1xsoundc.96 ASI_TX_CH4_EN Capture Switch
  ok 2 name.titac5x1xsoundc.96
  ok 3 write_default.titac5x1xsoundc.96
  ok 4 write_valid.titac5x1xsoundc.96
  ok 5 write_invalid.titac5x1xsoundc.96
  ok 6 event_missing.titac5x1xsoundc.96
  ok 7 event_spurious.titac5x1xsoundc.96
  ok 8 get_value.titac5x1xsoundc.95
  # titac5x1xsoundc.95 ASI_TX_CH3_EN Capture Switch
  ok 9 name.titac5x1xsoundc.95
  ok 10 write_default.titac5x1xsoundc.95
  ok 11 write_valid.titac5x1xsoundc.95
  ok 12 write_invalid.titac5x1xsoundc.95
  ok 13 event_missing.titac5x1xsoundc.95
  ok 14 event_spurious.titac5x1xsoundc.95
  ok 15 get_value.titac5x1xsoundc.94
  # titac5x1xsoundc.94 PDM ch3 & ch4 Datain Select
  ok 16 name.titac5x1xsoundc.94
  ok 17 write_default.titac5x1xsoundc.94
  ok 18 write_valid.titac5x1xsoundc.94
  ok 19 write_invalid.titac5x1xsoundc.94
  ok 20 event_missing.titac5x1xsoundc.94
  ok 21 event_spurious.titac5x1xsoundc.94
  ok 22 get_value.titac5x1xsoundc.93
  # titac5x1xsoundc.93 PDM ch1 & ch2 Datain Select
  ok 23 name.titac5x1xsoundc.93
  ok 24 write_default.titac5x1xsoundc.93
  ok 25 write_valid.titac5x1xsoundc.93
  ok 26 write_invalid.titac5x1xsoundc.93
  ok 27 event_missing.titac5x1xsoundc.93
  ok 28 event_spurious.titac5x1xsoundc.93
  ok 29 get_value.titac5x1xsoundc.92
  # titac5x1xsoundc.92 IN2 Source Mux
  ok 30 name.titac5x1xsoundc.92
  ok 31 write_default.titac5x1xsoundc.92
  ok 32 write_valid.titac5x1xsoundc.92
  ok 33 write_invalid.titac5x1xsoundc.92
  ok 34 event_missing.titac5x1xsoundc.92
  ok 35 event_spurious.titac5x1xsoundc.92
  ok 36 get_value.titac5x1xsoundc.91
  # titac5x1xsoundc.91 IN1 Source Mux
  ok 37 name.titac5x1xsoundc.91
  ok 38 write_default.titac5x1xsoundc.91
  ok 39 write_valid.titac5x1xsoundc.91
  ok 40 write_invalid.titac5x1xsoundc.91
  ok 41 event_missing.titac5x1xsoundc.91
  ok 42 event_spurious.titac5x1xsoundc.91
  ok 43 get_value.titac5x1xsoundc.90
  # titac5x1xsoundc.90 ADC2 Config
  ok 44 name.titac5x1xsoundc.90
  ok 45 write_default.titac5x1xsoundc.90
  ok 46 write_valid.titac5x1xsoundc.90
  ok 47 write_invalid.titac5x1xsoundc.90
  ok 48 event_missing.titac5x1xsoundc.90
  ok 49 event_spurious.titac5x1xsoundc.90
  ok 50 get_value.titac5x1xsoundc.89
  # titac5x1xsoundc.89 ADC2 Full-Scale
  ok 51 name.titac5x1xsoundc.89
  ok 52 write_default.titac5x1xsoundc.89
  ok 53 write_valid.titac5x1xsoundc.89
  ok 54 write_invalid.titac5x1xsoundc.89
  ok 55 event_missing.titac5x1xsoundc.89
  ok 56 event_spurious.titac5x1xsoundc.89
  ok 57 get_value.titac5x1xsoundc.88
  # titac5x1xsoundc.88 ASI_RX_CH2_EN Switch
  ok 58 name.titac5x1xsoundc.88
  ok 59 write_default.titac5x1xsoundc.88
  ok 60 write_valid.titac5x1xsoundc.88
  ok 61 write_invalid.titac5x1xsoundc.88
  ok 62 event_missing.titac5x1xsoundc.88
  ok 63 event_spurious.titac5x1xsoundc.88
  ok 64 get_value.titac5x1xsoundc.87
  # titac5x1xsoundc.87 OUT2x Driver
  ok 65 name.titac5x1xsoundc.87
  ok 66 write_default.titac5x1xsoundc.87
  ok 67 write_valid.titac5x1xsoundc.87
  ok 68 write_invalid.titac5x1xsoundc.87
  ok 69 event_missing.titac5x1xsoundc.87
  ok 70 event_spurious.titac5x1xsoundc.87
  ok 71 get_value.titac5x1xsoundc.86
  # titac5x1xsoundc.86 OUT2x Config
  ok 72 name.titac5x1xsoundc.86
  ok 73 write_default.titac5x1xsoundc.86
  ok 74 write_valid.titac5x1xsoundc.86
  ok 75 write_invalid.titac5x1xsoundc.86
  ok 76 event_missing.titac5x1xsoundc.86
  ok 77 event_spurious.titac5x1xsoundc.86
  ok 78 get_value.titac5x1xsoundc.85
  # titac5x1xsoundc.85 OUT2x Source
  ok 79 name.titac5x1xsoundc.85
  ok 80 write_default.titac5x1xsoundc.85
  ok 81 write_valid.titac5x1xsoundc.85
  ok 82 write_invalid.titac5x1xsoundc.85
  ok 83 event_missing.titac5x1xsoundc.85
  ok 84 event_spurious.titac5x1xsoundc.85
  ok 85 get_value.titac5x1xsoundc.84
  # titac5x1xsoundc.84 ASI_RX_CH1_EN Switch
  ok 86 name.titac5x1xsoundc.84
  ok 87 write_default.titac5x1xsoundc.84
  ok 88 write_valid.titac5x1xsoundc.84
  ok 89 write_invalid.titac5x1xsoundc.84
  ok 90 event_missing.titac5x1xsoundc.84
  ok 91 event_spurious.titac5x1xsoundc.84
  ok 92 get_value.titac5x1xsoundc.83
  # titac5x1xsoundc.83 OUT1x Driver
  ok 93 name.titac5x1xsoundc.83
  ok 94 write_default.titac5x1xsoundc.83
  ok 95 write_valid.titac5x1xsoundc.83
  ok 96 write_invalid.titac5x1xsoundc.83
  ok 97 event_missing.titac5x1xsoundc.83
  ok 98 event_spurious.titac5x1xsoundc.83
  ok 99 get_value.titac5x1xsoundc.82
  # titac5x1xsoundc.82 OUT1x Config
  ok 100 name.titac5x1xsoundc.82
  ok 101 write_default.titac5x1xsoundc.82
  ok 102 write_valid.titac5x1xsoundc.82
  ok 103 write_invalid.titac5x1xsoundc.82
  ok 104 event_missing.titac5x1xsoundc.82
  ok 105 event_spurious.titac5x1xsoundc.82
  ok 106 get_value.titac5x1xsoundc.81
  # titac5x1xsoundc.81 OUT1x Source
  ok 107 name.titac5x1xsoundc.81
  ok 108 write_default.titac5x1xsoundc.81
  ok 109 write_valid.titac5x1xsoundc.81
  ok 110 write_invalid.titac5x1xsoundc.81
  ok 111 event_missing.titac5x1xsoundc.81
  ok 112 event_spurious.titac5x1xsoundc.81
  ok 113 get_value.titac5x1xsoundc.80
  # titac5x1xsoundc.80 ASI_TX_CH2_EN Capture Switch
  ok 114 name.titac5x1xsoundc.80
  ok 115 write_default.titac5x1xsoundc.80
  ok 116 write_valid.titac5x1xsoundc.80
  ok 117 write_invalid.titac5x1xsoundc.80
  ok 118 event_missing.titac5x1xsoundc.80
  ok 119 event_spurious.titac5x1xsoundc.80
  ok 120 get_value.titac5x1xsoundc.79
  # titac5x1xsoundc.79 ASI_TX_CH1_EN Capture Switch
  ok 121 name.titac5x1xsoundc.79
  ok 122 write_default.titac5x1xsoundc.79
  ok 123 write_valid.titac5x1xsoundc.79
  ok 124 write_invalid.titac5x1xsoundc.79
  ok 125 event_missing.titac5x1xsoundc.79
  ok 126 event_spurious.titac5x1xsoundc.79
  ok 127 get_value.titac5x1xsoundc.78
  # titac5x1xsoundc.78 ADC1 Config
  ok 128 name.titac5x1xsoundc.78
  ok 129 write_default.titac5x1xsoundc.78
  ok 130 write_valid.titac5x1xsoundc.78
  ok 131 write_invalid.titac5x1xsoundc.78
  ok 132 event_missing.titac5x1xsoundc.78
  ok 133 event_spurious.titac5x1xsoundc.78
  ok 134 get_value.titac5x1xsoundc.77
  # titac5x1xsoundc.77 ADC1 Full-Scale
  ok 135 name.titac5x1xsoundc.77
  ok 136 write_default.titac5x1xsoundc.77
  ok 137 write_valid.titac5x1xsoundc.77
  ok 138 write_invalid.titac5x1xsoundc.77
  ok 139 event_missing.titac5x1xsoundc.77
  ok 140 event_spurious.titac5x1xsoundc.77
  ok 141 get_value.titac5x1xsoundc.76
  # titac5x1xsoundc.76 IN_CH4_EN Capture Switch
  ok 142 name.titac5x1xsoundc.76
  ok 143 write_default.titac5x1xsoundc.76
  ok 144 write_valid.titac5x1xsoundc.76
  ok 145 write_invalid.titac5x1xsoundc.76
  ok 146 event_missing.titac5x1xsoundc.76
  ok 147 event_spurious.titac5x1xsoundc.76
  ok 148 get_value.titac5x1xsoundc.75
  # titac5x1xsoundc.75 IN_CH3_EN Capture Switch
  ok 149 name.titac5x1xsoundc.75
  ok 150 write_default.titac5x1xsoundc.75
  ok 151 write_valid.titac5x1xsoundc.75
  ok 152 write_invalid.titac5x1xsoundc.75
  ok 153 event_missing.titac5x1xsoundc.75
  ok 154 event_spurious.titac5x1xsoundc.75
  ok 155 get_value.titac5x1xsoundc.74
  # titac5x1xsoundc.74 IN_CH2_EN Capture Switch
  ok 156 name.titac5x1xsoundc.74
  ok 157 write_default.titac5x1xsoundc.74
  ok 158 write_valid.titac5x1xsoundc.74
  ok 159 write_invalid.titac5x1xsoundc.74
  ok 160 event_missing.titac5x1xsoundc.74
  ok 161 event_spurious.titac5x1xsoundc.74
  ok 162 get_value.titac5x1xsoundc.73
  # titac5x1xsoundc.73 IN_CH1_EN Capture Switch
  ok 163 name.titac5x1xsoundc.73
  ok 164 write_default.titac5x1xsoundc.73
  ok 165 write_valid.titac5x1xsoundc.73
  ok 166 write_invalid.titac5x1xsoundc.73
  ok 167 event_missing.titac5x1xsoundc.73
  ok 168 event_spurious.titac5x1xsoundc.73
  ok 169 get_value.titac5x1xsoundc.72
  # titac5x1xsoundc.72 ASI_TX_CH8_SLOT
  ok 170 name.titac5x1xsoundc.72
  ok 171 write_default.titac5x1xsoundc.72
  ok 172 write_valid.titac5x1xsoundc.72
  ok 173 write_invalid.titac5x1xsoundc.72
  ok 174 event_missing.titac5x1xsoundc.72
  ok 175 event_spurious.titac5x1xsoundc.72
  ok 176 get_value.titac5x1xsoundc.71
  # titac5x1xsoundc.71 ASI_TX_CH7_SLOT
  ok 177 name.titac5x1xsoundc.71
  ok 178 write_default.titac5x1xsoundc.71
  ok 179 write_valid.titac5x1xsoundc.71
  ok 180 write_invalid.titac5x1xsoundc.71
  ok 181 event_missing.titac5x1xsoundc.71
  ok 182 event_spurious.titac5x1xsoundc.71
  ok 183 get_value.titac5x1xsoundc.70
  # titac5x1xsoundc.70 ASI_TX_CH6_SLOT
  ok 184 name.titac5x1xsoundc.70
  ok 185 write_default.titac5x1xsoundc.70
  ok 186 write_valid.titac5x1xsoundc.70
  ok 187 write_invalid.titac5x1xsoundc.70
  ok 188 event_missing.titac5x1xsoundc.70
  ok 189 event_spurious.titac5x1xsoundc.70
  ok 190 get_value.titac5x1xsoundc.69
  # titac5x1xsoundc.69 ASI_TX_CH5_SLOT
  ok 191 name.titac5x1xsoundc.69
  ok 192 write_default.titac5x1xsoundc.69
  ok 193 write_valid.titac5x1xsoundc.69
  ok 194 write_invalid.titac5x1xsoundc.69
  ok 195 event_missing.titac5x1xsoundc.69
  ok 196 event_spurious.titac5x1xsoundc.69
  ok 197 get_value.titac5x1xsoundc.68
  # titac5x1xsoundc.68 ASI_TX_CH4_SLOT
  ok 198 name.titac5x1xsoundc.68
  ok 199 write_default.titac5x1xsoundc.68
  ok 200 write_valid.titac5x1xsoundc.68
  ok 201 write_invalid.titac5x1xsoundc.68
  ok 202 event_missing.titac5x1xsoundc.68
  ok 203 event_spurious.titac5x1xsoundc.68
  ok 204 get_value.titac5x1xsoundc.67
  # titac5x1xsoundc.67 ASI_TX_CH3_SLOT
  ok 205 name.titac5x1xsoundc.67
  ok 206 write_default.titac5x1xsoundc.67
  ok 207 write_valid.titac5x1xsoundc.67
  ok 208 write_invalid.titac5x1xsoundc.67
  ok 209 event_missing.titac5x1xsoundc.67
  ok 210 event_spurious.titac5x1xsoundc.67
  ok 211 get_value.titac5x1xsoundc.66
  # titac5x1xsoundc.66 ASI_TX_CH2_SLOT
  ok 212 name.titac5x1xsoundc.66
  ok 213 write_default.titac5x1xsoundc.66
  ok 214 write_valid.titac5x1xsoundc.66
  ok 215 write_invalid.titac5x1xsoundc.66
  ok 216 event_missing.titac5x1xsoundc.66
  ok 217 event_spurious.titac5x1xsoundc.66
  ok 218 get_value.titac5x1xsoundc.65
  # titac5x1xsoundc.65 ASI_TX_CH1_SLOT
  ok 219 name.titac5x1xsoundc.65
  ok 220 write_default.titac5x1xsoundc.65
  ok 221 write_valid.titac5x1xsoundc.65
  ok 222 write_invalid.titac5x1xsoundc.65
  ok 223 event_missing.titac5x1xsoundc.65
  ok 224 event_spurious.titac5x1xsoundc.65
  ok 225 get_value.titac5x1xsoundc.64
  # titac5x1xsoundc.64 ASI_TX_CH8_CFG
  ok 226 name.titac5x1xsoundc.64
  ok 227 write_default.titac5x1xsoundc.64
  ok 228 write_valid.titac5x1xsoundc.64
  ok 229 write_invalid.titac5x1xsoundc.64
  ok 230 event_missing.titac5x1xsoundc.64
  ok 231 event_spurious.titac5x1xsoundc.64
  ok 232 get_value.titac5x1xsoundc.63
  # titac5x1xsoundc.63 ASI_TX_CH7_CFG
  ok 233 name.titac5x1xsoundc.63
  ok 234 write_default.titac5x1xsoundc.63
  ok 235 write_valid.titac5x1xsoundc.63
  ok 236 write_invalid.titac5x1xsoundc.63
  ok 237 event_missing.titac5x1xsoundc.63
  ok 238 event_spurious.titac5x1xsoundc.63
  ok 239 get_value.titac5x1xsoundc.62
  # titac5x1xsoundc.62 ASI_TX_CH6_CFG
  ok 240 name.titac5x1xsoundc.62
  ok 241 write_default.titac5x1xsoundc.62
  ok 242 write_valid.titac5x1xsoundc.62
  ok 243 write_invalid.titac5x1xsoundc.62
  ok 244 event_missing.titac5x1xsoundc.62
  ok 245 event_spurious.titac5x1xsoundc.62
  ok 246 get_value.titac5x1xsoundc.61
  # titac5x1xsoundc.61 ASI_TX_CH5_CFG
  ok 247 name.titac5x1xsoundc.61
  ok 248 write_default.titac5x1xsoundc.61
  ok 249 write_valid.titac5x1xsoundc.61
  ok 250 write_invalid.titac5x1xsoundc.61
  ok 251 event_missing.titac5x1xsoundc.61
  ok 252 event_spurious.titac5x1xsoundc.61
  ok 253 get_value.titac5x1xsoundc.60
  # titac5x1xsoundc.60 ADC1 Phase Capture Volume
  ok 254 name.titac5x1xsoundc.60
  ok 255 write_default.titac5x1xsoundc.60
  ok 256 write_valid.titac5x1xsoundc.60
  ok 257 write_invalid.titac5x1xsoundc.60
  ok 258 event_missing.titac5x1xsoundc.60
  ok 259 event_spurious.titac5x1xsoundc.60
  ok 260 get_value.titac5x1xsoundc.59
  # titac5x1xsoundc.59 ADC1 Fine Capture Volume
  ok 261 name.titac5x1xsoundc.59
  ok 262 write_default.titac5x1xsoundc.59
  ok 263 write_valid.titac5x1xsoundc.59
  ok 264 write_invalid.titac5x1xsoundc.59
  ok 265 event_missing.titac5x1xsoundc.59
  ok 266 event_spurious.titac5x1xsoundc.59
  ok 267 get_value.titac5x1xsoundc.58
  # titac5x1xsoundc.58 ADC1 Digital Capture Volume
  ok 268 name.titac5x1xsoundc.58
  ok 269 write_default.titac5x1xsoundc.58
  ok 270 write_valid.titac5x1xsoundc.58
  ok 271 write_invalid.titac5x1xsoundc.58
  ok 272 event_missing.titac5x1xsoundc.58
  ok 273 event_spurious.titac5x1xsoundc.58
  ok 274 get_value.titac5x1xsoundc.57
  # titac5x1xsoundc.57 ADC1 Audio BW
  ok 275 name.titac5x1xsoundc.57
  ok 276 write_default.titac5x1xsoundc.57
  ok 277 write_valid.titac5x1xsoundc.57
  ok 278 write_invalid.titac5x1xsoundc.57
  ok 279 event_missing.titac5x1xsoundc.57
  ok 280 event_spurious.titac5x1xsoundc.57
  ok 281 get_value.titac5x1xsoundc.56
  # titac5x1xsoundc.56 Record Decimation Filter
  ok 282 name.titac5x1xsoundc.56
  ok 283 write_default.titac5x1xsoundc.56
  ok 284 write_valid.titac5x1xsoundc.56
  ok 285 write_invalid.titac5x1xsoundc.56
  ok 286 event_missing.titac5x1xsoundc.56
  ok 287 event_spurious.titac5x1xsoundc.56
  ok 288 get_value.titac5x1xsoundc.55
  # titac5x1xsoundc.55 GPIO2 GPI
  ok 289 name.titac5x1xsoundc.55
  # GPIO2 GPI is not writeable
  ok 290 # SKIP write_default.titac5x1xsoundc.55
  # GPIO2 GPI is not writeable
  ok 291 # SKIP write_valid.titac5x1xsoundc.55
  # GPIO2 GPI is not writeable
  ok 292 # SKIP write_invalid.titac5x1xsoundc.55
  ok 293 event_missing.titac5x1xsoundc.55
  ok 294 event_spurious.titac5x1xsoundc.55
  ok 295 get_value.titac5x1xsoundc.54
  # titac5x1xsoundc.54 PDM4 Phase Capture Volume
  ok 296 name.titac5x1xsoundc.54
  ok 297 write_default.titac5x1xsoundc.54
  ok 298 write_valid.titac5x1xsoundc.54
  ok 299 write_invalid.titac5x1xsoundc.54
  ok 300 event_missing.titac5x1xsoundc.54
  ok 301 event_spurious.titac5x1xsoundc.54
  ok 302 get_value.titac5x1xsoundc.53
  # titac5x1xsoundc.53 PDM3 Phase Capture Volume
  ok 303 name.titac5x1xsoundc.53
  ok 304 write_default.titac5x1xsoundc.53
  ok 305 write_valid.titac5x1xsoundc.53
  ok 306 write_invalid.titac5x1xsoundc.53
  ok 307 event_missing.titac5x1xsoundc.53
  ok 308 event_spurious.titac5x1xsoundc.53
  ok 309 get_value.titac5x1xsoundc.52
  # titac5x1xsoundc.52 PDM4 Fine Capture Volume
  ok 310 name.titac5x1xsoundc.52
  ok 311 write_default.titac5x1xsoundc.52
  ok 312 write_valid.titac5x1xsoundc.52
  ok 313 write_invalid.titac5x1xsoundc.52
  ok 314 event_missing.titac5x1xsoundc.52
  ok 315 event_spurious.titac5x1xsoundc.52
  ok 316 get_value.titac5x1xsoundc.51
  # titac5x1xsoundc.51 PDM3 Fine Capture Volume
  ok 317 name.titac5x1xsoundc.51
  ok 318 write_default.titac5x1xsoundc.51
  ok 319 write_valid.titac5x1xsoundc.51
  ok 320 write_invalid.titac5x1xsoundc.51
  ok 321 event_missing.titac5x1xsoundc.51
  ok 322 event_spurious.titac5x1xsoundc.51
  ok 323 get_value.titac5x1xsoundc.50
  # titac5x1xsoundc.50 PDM4 Digital Capture Volume
  ok 324 name.titac5x1xsoundc.50
  ok 325 write_default.titac5x1xsoundc.50
  ok 326 write_valid.titac5x1xsoundc.50
  ok 327 write_invalid.titac5x1xsoundc.50
  ok 328 event_missing.titac5x1xsoundc.50
  ok 329 event_spurious.titac5x1xsoundc.50
  ok 330 get_value.titac5x1xsoundc.49
  # titac5x1xsoundc.49 PDM3 Digital Capture Volume
  ok 331 name.titac5x1xsoundc.49
  ok 332 write_default.titac5x1xsoundc.49
  ok 333 write_valid.titac5x1xsoundc.49
  ok 334 write_invalid.titac5x1xsoundc.49
  ok 335 event_missing.titac5x1xsoundc.49
  ok 336 event_spurious.titac5x1xsoundc.49
  ok 337 get_value.titac5x1xsoundc.48
  # titac5x1xsoundc.48 PDM2 Phase Capture Volume
  ok 338 name.titac5x1xsoundc.48
  ok 339 write_default.titac5x1xsoundc.48
  ok 340 write_valid.titac5x1xsoundc.48
  ok 341 write_invalid.titac5x1xsoundc.48
  ok 342 event_missing.titac5x1xsoundc.48
  ok 343 event_spurious.titac5x1xsoundc.48
  ok 344 get_value.titac5x1xsoundc.47
  # titac5x1xsoundc.47 PDM1 Phase Capture Volume
  ok 345 name.titac5x1xsoundc.47
  ok 346 write_default.titac5x1xsoundc.47
  ok 347 write_valid.titac5x1xsoundc.47
  ok 348 write_invalid.titac5x1xsoundc.47
  ok 349 event_missing.titac5x1xsoundc.47
  ok 350 event_spurious.titac5x1xsoundc.47
  ok 351 get_value.titac5x1xsoundc.46
  # titac5x1xsoundc.46 PDM2 Fine Capture Volume
  ok 352 name.titac5x1xsoundc.46
  ok 353 write_default.titac5x1xsoundc.46
  ok 354 write_valid.titac5x1xsoundc.46
  ok 355 write_invalid.titac5x1xsoundc.46
  ok 356 event_missing.titac5x1xsoundc.46
  ok 357 event_spurious.titac5x1xsoundc.46
  ok 358 get_value.titac5x1xsoundc.45
  # titac5x1xsoundc.45 PDM1 Fine Capture Volume
  ok 359 name.titac5x1xsoundc.45
  ok 360 write_default.titac5x1xsoundc.45
  ok 361 write_valid.titac5x1xsoundc.45
  ok 362 write_invalid.titac5x1xsoundc.45
  ok 363 event_missing.titac5x1xsoundc.45
  ok 364 event_spurious.titac5x1xsoundc.45
  ok 365 get_value.titac5x1xsoundc.44
  # titac5x1xsoundc.44 PDM2 Digital Capture Volume
  ok 366 name.titac5x1xsoundc.44
  ok 367 write_default.titac5x1xsoundc.44
  ok 368 write_valid.titac5x1xsoundc.44
  ok 369 write_invalid.titac5x1xsoundc.44
  ok 370 event_missing.titac5x1xsoundc.44
  ok 371 event_spurious.titac5x1xsoundc.44
  ok 372 get_value.titac5x1xsoundc.43
  # titac5x1xsoundc.43 PDM1 Digital Capture Volume
  ok 373 name.titac5x1xsoundc.43
  ok 374 write_default.titac5x1xsoundc.43
  ok 375 write_valid.titac5x1xsoundc.43
  ok 376 write_invalid.titac5x1xsoundc.43
  ok 377 event_missing.titac5x1xsoundc.43
  ok 378 event_spurious.titac5x1xsoundc.43
  ok 379 get_value.titac5x1xsoundc.42
  # titac5x1xsoundc.42 PDM Clk Divider
  ok 380 name.titac5x1xsoundc.42
  ok 381 write_default.titac5x1xsoundc.42
  ok 382 write_valid.titac5x1xsoundc.42
  ok 383 write_invalid.titac5x1xsoundc.42
  ok 384 event_missing.titac5x1xsoundc.42
  ok 385 event_spurious.titac5x1xsoundc.42
  ok 386 get_value.titac5x1xsoundc.41
  # titac5x1xsoundc.41 OUT2X_VCOM
  ok 387 name.titac5x1xsoundc.41
  ok 388 write_default.titac5x1xsoundc.41
  ok 389 write_valid.titac5x1xsoundc.41
  ok 390 write_invalid.titac5x1xsoundc.41
  ok 391 event_missing.titac5x1xsoundc.41
  ok 392 event_spurious.titac5x1xsoundc.41
  ok 393 get_value.titac5x1xsoundc.40
  # titac5x1xsoundc.40 DAC2 Audio BW
  ok 394 name.titac5x1xsoundc.40
  ok 395 write_default.titac5x1xsoundc.40
  ok 396 write_valid.titac5x1xsoundc.40
  ok 397 write_invalid.titac5x1xsoundc.40
  ok 398 event_missing.titac5x1xsoundc.40
  ok 399 event_spurious.titac5x1xsoundc.40
  ok 400 get_value.titac5x1xsoundc.39
  # titac5x1xsoundc.39 DAC2 CHB Gain Calibration Playback Volume
  ok 401 name.titac5x1xsoundc.39
  ok 402 write_default.titac5x1xsoundc.39
  ok 403 write_valid.titac5x1xsoundc.39
  ok 404 write_invalid.titac5x1xsoundc.39
  ok 405 event_missing.titac5x1xsoundc.39
  ok 406 event_spurious.titac5x1xsoundc.39
  ok 407 get_value.titac5x1xsoundc.38
  # titac5x1xsoundc.38 DAC2 CHA Gain Calibration Playback Volume
  ok 408 name.titac5x1xsoundc.38
  ok 409 write_default.titac5x1xsoundc.38
  ok 410 write_valid.titac5x1xsoundc.38
  ok 411 write_invalid.titac5x1xsoundc.38
  ok 412 event_missing.titac5x1xsoundc.38
  ok 413 event_spurious.titac5x1xsoundc.38
  ok 414 get_value.titac5x1xsoundc.37
  # titac5x1xsoundc.37 DAC2 CHB Digital Playback Volume
  ok 415 name.titac5x1xsoundc.37
  ok 416 write_default.titac5x1xsoundc.37
  ok 417 write_valid.titac5x1xsoundc.37
  ok 418 write_invalid.titac5x1xsoundc.37
  ok 419 event_missing.titac5x1xsoundc.37
  ok 420 event_spurious.titac5x1xsoundc.37
  ok 421 get_value.titac5x1xsoundc.36
  # titac5x1xsoundc.36 DAC2 CHA Digital Playback Volume
  ok 422 name.titac5x1xsoundc.36
  ok 423 write_default.titac5x1xsoundc.36
  ok 424 write_valid.titac5x1xsoundc.36
  ok 425 write_invalid.titac5x1xsoundc.36
  ok 426 event_missing.titac5x1xsoundc.36
  ok 427 event_spurious.titac5x1xsoundc.36
  ok 428 get_value.titac5x1xsoundc.35
  # titac5x1xsoundc.35 OUT2M Analog Level Playback Volume
  ok 429 name.titac5x1xsoundc.35
  ok 430 write_default.titac5x1xsoundc.35
  ok 431 write_valid.titac5x1xsoundc.35
  ok 432 write_invalid.titac5x1xsoundc.35
  ok 433 event_missing.titac5x1xsoundc.35
  ok 434 event_spurious.titac5x1xsoundc.35
  ok 435 get_value.titac5x1xsoundc.34
  # titac5x1xsoundc.34 OUT2P Analog Level Playback Volume
  ok 436 name.titac5x1xsoundc.34
  ok 437 write_default.titac5x1xsoundc.34
  ok 438 write_valid.titac5x1xsoundc.34
  ok 439 write_invalid.titac5x1xsoundc.34
  ok 440 event_missing.titac5x1xsoundc.34
  ok 441 event_spurious.titac5x1xsoundc.34
  ok 442 get_value.titac5x1xsoundc.33
  # titac5x1xsoundc.33 ADC2 Phase Capture Volume
  ok 443 name.titac5x1xsoundc.33
  ok 444 write_default.titac5x1xsoundc.33
  ok 445 write_valid.titac5x1xsoundc.33
  ok 446 write_invalid.titac5x1xsoundc.33
  ok 447 event_missing.titac5x1xsoundc.33
  ok 448 event_spurious.titac5x1xsoundc.33
  ok 449 get_value.titac5x1xsoundc.32
  # titac5x1xsoundc.32 ADC2 Fine Capture Volume
  ok 450 name.titac5x1xsoundc.32
  ok 451 write_default.titac5x1xsoundc.32
  ok 452 write_valid.titac5x1xsoundc.32
  ok 453 write_invalid.titac5x1xsoundc.32
  ok 454 event_missing.titac5x1xsoundc.32
  ok 455 event_spurious.titac5x1xsoundc.32
  ok 456 get_value.titac5x1xsoundc.31
  # titac5x1xsoundc.31 ADC2 Digital Capture Volume
  ok 457 name.titac5x1xsoundc.31
  ok 458 write_default.titac5x1xsoundc.31
  ok 459 write_valid.titac5x1xsoundc.31
  ok 460 write_invalid.titac5x1xsoundc.31
  ok 461 event_missing.titac5x1xsoundc.31
  ok 462 event_spurious.titac5x1xsoundc.31
  ok 463 get_value.titac5x1xsoundc.30
  # titac5x1xsoundc.30 ADC2 Audio BW
  ok 464 name.titac5x1xsoundc.30
  ok 465 write_default.titac5x1xsoundc.30
  ok 466 write_valid.titac5x1xsoundc.30
  ok 467 write_invalid.titac5x1xsoundc.30
  ok 468 event_missing.titac5x1xsoundc.30
  ok 469 event_spurious.titac5x1xsoundc.30
  ok 470 get_value.titac5x1xsoundc.29
  # titac5x1xsoundc.29 OUT_CH4_EN Playback Switch
  ok 471 name.titac5x1xsoundc.29
  ok 472 write_default.titac5x1xsoundc.29
  ok 473 write_valid.titac5x1xsoundc.29
  ok 474 write_invalid.titac5x1xsoundc.29
  ok 475 event_missing.titac5x1xsoundc.29
  ok 476 event_spurious.titac5x1xsoundc.29
  ok 477 get_value.titac5x1xsoundc.28
  # titac5x1xsoundc.28 OUT_CH3_EN Playback Switch
  ok 478 name.titac5x1xsoundc.28
  ok 479 write_default.titac5x1xsoundc.28
  ok 480 write_valid.titac5x1xsoundc.28
  ok 481 write_invalid.titac5x1xsoundc.28
  ok 482 event_missing.titac5x1xsoundc.28
  ok 483 event_spurious.titac5x1xsoundc.28
  ok 484 get_value.titac5x1xsoundc.27
  # titac5x1xsoundc.27 OUT_CH2_EN Playback Switch
  ok 485 name.titac5x1xsoundc.27
  ok 486 write_default.titac5x1xsoundc.27
  ok 487 write_valid.titac5x1xsoundc.27
  ok 488 write_invalid.titac5x1xsoundc.27
  ok 489 event_missing.titac5x1xsoundc.27
  ok 490 event_spurious.titac5x1xsoundc.27
  ok 491 get_value.titac5x1xsoundc.26
  # titac5x1xsoundc.26 OUT_CH1_EN Playback Switch
  ok 492 name.titac5x1xsoundc.26
  ok 493 write_default.titac5x1xsoundc.26
  ok 494 write_valid.titac5x1xsoundc.26
  ok 495 write_invalid.titac5x1xsoundc.26
  ok 496 event_missing.titac5x1xsoundc.26
  ok 497 event_spurious.titac5x1xsoundc.26
  ok 498 get_value.titac5x1xsoundc.25
  # titac5x1xsoundc.25 ASI_RX_CH8_SLOT Playback
  ok 499 name.titac5x1xsoundc.25
  ok 500 write_default.titac5x1xsoundc.25
  ok 501 write_valid.titac5x1xsoundc.25
  ok 502 write_invalid.titac5x1xsoundc.25
  ok 503 event_missing.titac5x1xsoundc.25
  ok 504 event_spurious.titac5x1xsoundc.25
  ok 505 get_value.titac5x1xsoundc.24
  # titac5x1xsoundc.24 ASI_RX_CH7_SLOT Playback
  ok 506 name.titac5x1xsoundc.24
  ok 507 write_default.titac5x1xsoundc.24
  ok 508 write_valid.titac5x1xsoundc.24
  ok 509 write_invalid.titac5x1xsoundc.24
  ok 510 event_missing.titac5x1xsoundc.24
  ok 511 event_spurious.titac5x1xsoundc.24
  ok 512 get_value.titac5x1xsoundc.23
  # titac5x1xsoundc.23 ASI_RX_CH6_SLOT Playback
  ok 513 name.titac5x1xsoundc.23
  ok 514 write_default.titac5x1xsoundc.23
  ok 515 write_valid.titac5x1xsoundc.23
  ok 516 write_invalid.titac5x1xsoundc.23
  ok 517 event_missing.titac5x1xsoundc.23
  ok 518 event_spurious.titac5x1xsoundc.23
  ok 519 get_value.titac5x1xsoundc.22
  # titac5x1xsoundc.22 ASI_RX_CH5_SLOT Playback
  ok 520 name.titac5x1xsoundc.22
  ok 521 write_default.titac5x1xsoundc.22
  ok 522 write_valid.titac5x1xsoundc.22
  ok 523 write_invalid.titac5x1xsoundc.22
  ok 524 event_missing.titac5x1xsoundc.22
  ok 525 event_spurious.titac5x1xsoundc.22
  ok 526 get_value.titac5x1xsoundc.21
  # titac5x1xsoundc.21 ASI_RX_CH4_SLOT Playback
  ok 527 name.titac5x1xsoundc.21
  ok 528 write_default.titac5x1xsoundc.21
  ok 529 write_valid.titac5x1xsoundc.21
  ok 530 write_invalid.titac5x1xsoundc.21
  ok 531 event_missing.titac5x1xsoundc.21
  ok 532 event_spurious.titac5x1xsoundc.21
  ok 533 get_value.titac5x1xsoundc.20
  # titac5x1xsoundc.20 ASI_RX_CH3_SLOT Playback
  ok 534 name.titac5x1xsoundc.20
  ok 535 write_default.titac5x1xsoundc.20
  ok 536 write_valid.titac5x1xsoundc.20
  ok 537 write_invalid.titac5x1xsoundc.20
  ok 538 event_missing.titac5x1xsoundc.20
  ok 539 event_spurious.titac5x1xsoundc.20
  ok 540 get_value.titac5x1xsoundc.19
  # titac5x1xsoundc.19 ASI_RX_CH2_SLOT Playback
  ok 541 name.titac5x1xsoundc.19
  ok 542 write_default.titac5x1xsoundc.19
  ok 543 write_valid.titac5x1xsoundc.19
  ok 544 write_invalid.titac5x1xsoundc.19
  ok 545 event_missing.titac5x1xsoundc.19
  ok 546 event_spurious.titac5x1xsoundc.19
  ok 547 get_value.titac5x1xsoundc.18
  # titac5x1xsoundc.18 ASI_RX_CH1_SLOT Playback
  ok 548 name.titac5x1xsoundc.18
  ok 549 write_default.titac5x1xsoundc.18
  ok 550 write_valid.titac5x1xsoundc.18
  ok 551 write_invalid.titac5x1xsoundc.18
  ok 552 event_missing.titac5x1xsoundc.18
  ok 553 event_spurious.titac5x1xsoundc.18
  ok 554 get_value.titac5x1xsoundc.17
  # titac5x1xsoundc.17 ASI_RX_CH8_EN Playback
  ok 555 name.titac5x1xsoundc.17
  ok 556 write_default.titac5x1xsoundc.17
  ok 557 write_valid.titac5x1xsoundc.17
  ok 558 write_invalid.titac5x1xsoundc.17
  ok 559 event_missing.titac5x1xsoundc.17
  ok 560 event_spurious.titac5x1xsoundc.17
  ok 561 get_value.titac5x1xsoundc.16
  # titac5x1xsoundc.16 ASI_RX_CH7_EN Playback
  ok 562 name.titac5x1xsoundc.16
  ok 563 write_default.titac5x1xsoundc.16
  ok 564 write_valid.titac5x1xsoundc.16
  ok 565 write_invalid.titac5x1xsoundc.16
  ok 566 event_missing.titac5x1xsoundc.16
  ok 567 event_spurious.titac5x1xsoundc.16
  ok 568 get_value.titac5x1xsoundc.15
  # titac5x1xsoundc.15 ASI_RX_CH6_EN Playback
  ok 569 name.titac5x1xsoundc.15
  ok 570 write_default.titac5x1xsoundc.15
  ok 571 write_valid.titac5x1xsoundc.15
  ok 572 write_invalid.titac5x1xsoundc.15
  ok 573 event_missing.titac5x1xsoundc.15
  ok 574 event_spurious.titac5x1xsoundc.15
  ok 575 get_value.titac5x1xsoundc.14
  # titac5x1xsoundc.14 ASI_RX_CH5_EN Playback
  ok 576 name.titac5x1xsoundc.14
  ok 577 write_default.titac5x1xsoundc.14
  ok 578 write_valid.titac5x1xsoundc.14
  ok 579 write_invalid.titac5x1xsoundc.14
  ok 580 event_missing.titac5x1xsoundc.14
  ok 581 event_spurious.titac5x1xsoundc.14
  ok 582 get_value.titac5x1xsoundc.13
  # titac5x1xsoundc.13 ASI_RX_CH4_EN Playback
  ok 583 name.titac5x1xsoundc.13
  ok 584 write_default.titac5x1xsoundc.13
  ok 585 write_valid.titac5x1xsoundc.13
  ok 586 write_invalid.titac5x1xsoundc.13
  ok 587 event_missing.titac5x1xsoundc.13
  ok 588 event_spurious.titac5x1xsoundc.13
  ok 589 get_value.titac5x1xsoundc.12
  # titac5x1xsoundc.12 ASI_RX_CH3_EN Playback
  ok 590 name.titac5x1xsoundc.12
  ok 591 write_default.titac5x1xsoundc.12
  ok 592 write_valid.titac5x1xsoundc.12
  ok 593 write_invalid.titac5x1xsoundc.12
  ok 594 event_missing.titac5x1xsoundc.12
  ok 595 event_spurious.titac5x1xsoundc.12
  ok 596 get_value.titac5x1xsoundc.11
  # titac5x1xsoundc.11 DAC1 CHB Gain Calibration Playback Volume
  ok 597 name.titac5x1xsoundc.11
  ok 598 write_default.titac5x1xsoundc.11
  ok 599 write_valid.titac5x1xsoundc.11
  ok 600 write_invalid.titac5x1xsoundc.11
  ok 601 event_missing.titac5x1xsoundc.11
  ok 602 event_spurious.titac5x1xsoundc.11
  ok 603 get_value.titac5x1xsoundc.10
  # titac5x1xsoundc.10 DAC1 CHA Gain Calibration Playback Volume
  ok 604 name.titac5x1xsoundc.10
  ok 605 write_default.titac5x1xsoundc.10
  ok 606 write_valid.titac5x1xsoundc.10
  ok 607 write_invalid.titac5x1xsoundc.10
  ok 608 event_missing.titac5x1xsoundc.10
  ok 609 event_spurious.titac5x1xsoundc.10
  ok 610 get_value.titac5x1xsoundc.9
  # titac5x1xsoundc.9 DAC1 CHB Digital Playback Volume
  ok 611 name.titac5x1xsoundc.9
  ok 612 write_default.titac5x1xsoundc.9
  ok 613 write_valid.titac5x1xsoundc.9
  ok 614 write_invalid.titac5x1xsoundc.9
  ok 615 event_missing.titac5x1xsoundc.9
  ok 616 event_spurious.titac5x1xsoundc.9
  ok 617 get_value.titac5x1xsoundc.8
  # titac5x1xsoundc.8 DAC1 CHA Digital Playback Volume
  ok 618 name.titac5x1xsoundc.8
  ok 619 write_default.titac5x1xsoundc.8
  ok 620 write_valid.titac5x1xsoundc.8
  ok 621 write_invalid.titac5x1xsoundc.8
  ok 622 event_missing.titac5x1xsoundc.8
  ok 623 event_spurious.titac5x1xsoundc.8
  ok 624 get_value.titac5x1xsoundc.7
  # titac5x1xsoundc.7 OUT1M Analog Level Playback Volume
  ok 625 name.titac5x1xsoundc.7
  ok 626 write_default.titac5x1xsoundc.7
  ok 627 write_valid.titac5x1xsoundc.7
  ok 628 write_invalid.titac5x1xsoundc.7
  ok 629 event_missing.titac5x1xsoundc.7
  ok 630 event_spurious.titac5x1xsoundc.7
  ok 631 get_value.titac5x1xsoundc.6
  # titac5x1xsoundc.6 OUT1P Analog Level Playback Volume
  ok 632 name.titac5x1xsoundc.6
  ok 633 write_default.titac5x1xsoundc.6
  ok 634 write_valid.titac5x1xsoundc.6
  ok 635 write_invalid.titac5x1xsoundc.6
  ok 636 event_missing.titac5x1xsoundc.6
  ok 637 event_spurious.titac5x1xsoundc.6
  ok 638 get_value.titac5x1xsoundc.5
  # titac5x1xsoundc.5 DAC1 Audio BW
  ok 639 name.titac5x1xsoundc.5
  ok 640 write_default.titac5x1xsoundc.5
  ok 641 write_valid.titac5x1xsoundc.5
  ok 642 write_invalid.titac5x1xsoundc.5
  ok 643 event_missing.titac5x1xsoundc.5
  ok 644 event_spurious.titac5x1xsoundc.5
  ok 645 get_value.titac5x1xsoundc.4
  # titac5x1xsoundc.4 Playback Decimation Filter
  ok 646 name.titac5x1xsoundc.4
  ok 647 write_default.titac5x1xsoundc.4
  ok 648 write_valid.titac5x1xsoundc.4
  ok 649 write_invalid.titac5x1xsoundc.4
  ok 650 event_missing.titac5x1xsoundc.4
  ok 651 event_spurious.titac5x1xsoundc.4
  ok 652 get_value.titac5x1xsoundc.3
  # titac5x1xsoundc.3 ADC2 Common-mode Tolerance
  ok 653 name.titac5x1xsoundc.3
  ok 654 write_default.titac5x1xsoundc.3
  ok 655 write_valid.titac5x1xsoundc.3
  ok 656 write_invalid.titac5x1xsoundc.3
  ok 657 event_missing.titac5x1xsoundc.3
  ok 658 event_spurious.titac5x1xsoundc.3
  ok 659 get_value.titac5x1xsoundc.2
  # titac5x1xsoundc.2 ADC1 Common-mode Tolerance
  ok 660 name.titac5x1xsoundc.2
  ok 661 write_default.titac5x1xsoundc.2
  ok 662 write_valid.titac5x1xsoundc.2
  ok 663 write_invalid.titac5x1xsoundc.2
  ok 664 event_missing.titac5x1xsoundc.2
  ok 665 event_spurious.titac5x1xsoundc.2
  ok 666 get_value.titac5x1xsoundc.1
  # titac5x1xsoundc.1 ADC2 Impedance Select
  ok 667 name.titac5x1xsoundc.1
  ok 668 write_default.titac5x1xsoundc.1
  ok 669 write_valid.titac5x1xsoundc.1
  ok 670 write_invalid.titac5x1xsoundc.1
  ok 671 event_missing.titac5x1xsoundc.1
  ok 672 event_spurious.titac5x1xsoundc.1
  ok 673 get_value.titac5x1xsoundc.0
  # titac5x1xsoundc.0 ADC1 Impedance Select
  ok 674 name.titac5x1xsoundc.0
  ok 675 write_default.titac5x1xsoundc.0
  ok 676 write_valid.titac5x1xsoundc.0
  ok 677 write_invalid.titac5x1xsoundc.0
  ok 678 event_missing.titac5x1xsoundc.0
  ok 679 event_spurious.titac5x1xsoundc.0
  # 3 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
  # Totals: pass:676 fail:0 xfail:0 xpass:0 skip:3 error:0

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

Niranjan H Y (4):
  ASoc: tac5x1x: add codec driver tac5x1x family
  Asoc: tac5x1x: document tac5x1x codec
  Asoc: pcm6240: remove support for taac5x1x family
  ASoc: pcm6240: dt-bindings device support list update

 .../devicetree/bindings/sound/ti,pcm6240.yaml |   10 -
 .../devicetree/bindings/sound/ti,tac5x1x.yaml |  222 ++
 sound/soc/codecs/Kconfig                      |   16 +
 sound/soc/codecs/Makefile                     |    6 +-
 sound/soc/codecs/pcm6240.c                    |  124 +-
 sound/soc/codecs/pcm6240.h                    |    4 -
 sound/soc/codecs/tac5x1x-i2c.c                |   81 +
 sound/soc/codecs/tac5x1x.c                    | 2389 +++++++++++++++++
 sound/soc/codecs/tac5x1x.h                    |  302 +++
 9 files changed, 3018 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
 create mode 100644 sound/soc/codecs/tac5x1x-i2c.c
 create mode 100644 sound/soc/codecs/tac5x1x.c
 create mode 100644 sound/soc/codecs/tac5x1x.h

-- 
2.45.2

