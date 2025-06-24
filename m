Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F3AEB8D5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABF18602BE;
	Fri, 27 Jun 2025 15:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABF18602BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030775;
	bh=aipupTzATVZoFagLSijoD5rqtSLNhkkoqsHHLzAXKu8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iQk/DcnlEKoerFn//yRx/XH3WUj605PWSgpBj+2H+k8vTQfbZQz80kwH3HzN6TN3l
	 u0eG2vATLK2z6L9Nlj1kiZejd1sstsbrbLHJTS+sdpGh4ugFyAn7sn9U1xFCXv5ep9
	 neskiuYE7GP768Ns1GJK5f1ZyJxlxdb4R7cbi0BM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73D47F80611; Fri, 27 Jun 2025 15:23:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8D8F806CE;
	Fri, 27 Jun 2025 15:23:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06960F804CF; Tue, 24 Jun 2025 17:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41CC6F8026D
	for <alsa-devel@alsa-project.org>; Tue, 24 Jun 2025 17:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41CC6F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=t5mpxSWx
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OFbsPL1205288;
	Tue, 24 Jun 2025 10:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750779474;
	bh=3aaPMiwFL9M3umcAw50sTZ2hh83i5bQ4NUy7QJ8BrBM=;
	h=From:To:CC:Subject:Date;
	b=t5mpxSWxmWSVQbjZnucNSBN9agmW6P0v9yqFcxVIZHys2EdTV+fdd+wBze98P2/81
	 xhQP+RNQoe8ve2GcD2zHuBY9MrCt2UrGfs8olV6j5TGwAR5CnrLKQVgK3aqUPjBeDR
	 nya5hR0Es/ESPZMuTCyhW7tJ3b3rJoM+sAQ34bFU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OFbsJ9398506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 10:37:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 10:37:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 10:37:53 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14]
 (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OFboxk1744431;
	Tue, 24 Jun 2025 10:37:50 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>, <navada@ti.com>,
        <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v2 0/4] ASoc: tac5x1x: mixer-test report
Date: Tue, 24 Jun 2025 21:07:38 +0530
Message-ID: <20250624153742.1507-1-niranjan.hy@ti.com>
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
Message-ID-Hash: HRPQL2IQDWVCG4RUA6EEC3HJ5XO5ZI5B
X-Message-ID-Hash: HRPQL2IQDWVCG4RUA6EEC3HJ5XO5ZI5B
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRPQL2IQDWVCG4RUA6EEC3HJ5XO5ZI5B/>
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
  1..553
  ok 1 get_value.titac5x1xsoundc.78
  # titac5x1xsoundc.78 ASI_TX_CH4_EN Capture Switch
  ok 2 name.titac5x1xsoundc.78
  ok 3 write_default.titac5x1xsoundc.78
  ok 4 write_valid.titac5x1xsoundc.78
  ok 5 write_invalid.titac5x1xsoundc.78
  ok 6 event_missing.titac5x1xsoundc.78
  ok 7 event_spurious.titac5x1xsoundc.78
  ok 8 get_value.titac5x1xsoundc.77
  # titac5x1xsoundc.77 ASI_TX_CH3_EN Capture Switch
  ok 9 name.titac5x1xsoundc.77
  ok 10 write_default.titac5x1xsoundc.77
  ok 11 write_valid.titac5x1xsoundc.77
  ok 12 write_invalid.titac5x1xsoundc.77
  ok 13 event_missing.titac5x1xsoundc.77
  ok 14 event_spurious.titac5x1xsoundc.77
  ok 15 get_value.titac5x1xsoundc.76
  # titac5x1xsoundc.76 PDM ch3 & ch4 Datain Select
  ok 16 name.titac5x1xsoundc.76
  ok 17 write_default.titac5x1xsoundc.76
  ok 18 write_valid.titac5x1xsoundc.76
  ok 19 write_invalid.titac5x1xsoundc.76
  ok 20 event_missing.titac5x1xsoundc.76
  ok 21 event_spurious.titac5x1xsoundc.76
  ok 22 get_value.titac5x1xsoundc.75
  # titac5x1xsoundc.75 PDM ch1 & ch2 Datain Select
  ok 23 name.titac5x1xsoundc.75
  ok 24 write_default.titac5x1xsoundc.75
  ok 25 write_valid.titac5x1xsoundc.75
  ok 26 write_invalid.titac5x1xsoundc.75
  ok 27 event_missing.titac5x1xsoundc.75
  ok 28 event_spurious.titac5x1xsoundc.75
  ok 29 get_value.titac5x1xsoundc.74
  # titac5x1xsoundc.74 IN2 Source Mux
  ok 30 name.titac5x1xsoundc.74
  ok 31 write_default.titac5x1xsoundc.74
  ok 32 write_valid.titac5x1xsoundc.74
  ok 33 write_invalid.titac5x1xsoundc.74
  ok 34 event_missing.titac5x1xsoundc.74
  ok 35 event_spurious.titac5x1xsoundc.74
  ok 36 get_value.titac5x1xsoundc.73
  # titac5x1xsoundc.73 IN1 Source Mux
  ok 37 name.titac5x1xsoundc.73
  ok 38 write_default.titac5x1xsoundc.73
  ok 39 write_valid.titac5x1xsoundc.73
  ok 40 write_invalid.titac5x1xsoundc.73
  ok 41 event_missing.titac5x1xsoundc.73
  ok 42 event_spurious.titac5x1xsoundc.73
  ok 43 get_value.titac5x1xsoundc.72
  # titac5x1xsoundc.72 ADC2 Config
  ok 44 name.titac5x1xsoundc.72
  ok 45 write_default.titac5x1xsoundc.72
  ok 46 write_valid.titac5x1xsoundc.72
  ok 47 write_invalid.titac5x1xsoundc.72
  ok 48 event_missing.titac5x1xsoundc.72
  ok 49 event_spurious.titac5x1xsoundc.72
  ok 50 get_value.titac5x1xsoundc.71
  # titac5x1xsoundc.71 ADC2 Full-Scale
  ok 51 name.titac5x1xsoundc.71
  ok 52 write_default.titac5x1xsoundc.71
  ok 53 write_valid.titac5x1xsoundc.71
  ok 54 write_invalid.titac5x1xsoundc.71
  ok 55 event_missing.titac5x1xsoundc.71
  ok 56 event_spurious.titac5x1xsoundc.71
  ok 57 get_value.titac5x1xsoundc.70
  # titac5x1xsoundc.70 ASI_RX_CH2_EN Switch
  ok 58 name.titac5x1xsoundc.70
  ok 59 write_default.titac5x1xsoundc.70
  ok 60 write_valid.titac5x1xsoundc.70
  ok 61 write_invalid.titac5x1xsoundc.70
  ok 62 event_missing.titac5x1xsoundc.70
  ok 63 event_spurious.titac5x1xsoundc.70
  ok 64 get_value.titac5x1xsoundc.69
  # titac5x1xsoundc.69 OUT2x Driver
  ok 65 name.titac5x1xsoundc.69
  ok 66 write_default.titac5x1xsoundc.69
  ok 67 write_valid.titac5x1xsoundc.69
  ok 68 write_invalid.titac5x1xsoundc.69
  ok 69 event_missing.titac5x1xsoundc.69
  ok 70 event_spurious.titac5x1xsoundc.69
  ok 71 get_value.titac5x1xsoundc.68
  # titac5x1xsoundc.68 OUT2x Config
  ok 72 name.titac5x1xsoundc.68
  ok 73 write_default.titac5x1xsoundc.68
  ok 74 write_valid.titac5x1xsoundc.68
  ok 75 write_invalid.titac5x1xsoundc.68
  ok 76 event_missing.titac5x1xsoundc.68
  ok 77 event_spurious.titac5x1xsoundc.68
  ok 78 get_value.titac5x1xsoundc.67
  # titac5x1xsoundc.67 OUT2x Source
  ok 79 name.titac5x1xsoundc.67
  ok 80 write_default.titac5x1xsoundc.67
  ok 81 write_valid.titac5x1xsoundc.67
  ok 82 write_invalid.titac5x1xsoundc.67
  ok 83 event_missing.titac5x1xsoundc.67
  ok 84 event_spurious.titac5x1xsoundc.67
  ok 85 get_value.titac5x1xsoundc.66
  # titac5x1xsoundc.66 ASI_RX_CH1_EN Switch
  ok 86 name.titac5x1xsoundc.66
  ok 87 write_default.titac5x1xsoundc.66
  ok 88 write_valid.titac5x1xsoundc.66
  ok 89 write_invalid.titac5x1xsoundc.66
  ok 90 event_missing.titac5x1xsoundc.66
  ok 91 event_spurious.titac5x1xsoundc.66
  ok 92 get_value.titac5x1xsoundc.65
  # titac5x1xsoundc.65 OUT1x Driver
  ok 93 name.titac5x1xsoundc.65
  ok 94 write_default.titac5x1xsoundc.65
  ok 95 write_valid.titac5x1xsoundc.65
  ok 96 write_invalid.titac5x1xsoundc.65
  ok 97 event_missing.titac5x1xsoundc.65
  ok 98 event_spurious.titac5x1xsoundc.65
  ok 99 get_value.titac5x1xsoundc.64
  # titac5x1xsoundc.64 OUT1x Config
  ok 100 name.titac5x1xsoundc.64
  ok 101 write_default.titac5x1xsoundc.64
  ok 102 write_valid.titac5x1xsoundc.64
  ok 103 write_invalid.titac5x1xsoundc.64
  ok 104 event_missing.titac5x1xsoundc.64
  ok 105 event_spurious.titac5x1xsoundc.64
  ok 106 get_value.titac5x1xsoundc.63
  # titac5x1xsoundc.63 OUT1x Source
  ok 107 name.titac5x1xsoundc.63
  ok 108 write_default.titac5x1xsoundc.63
  ok 109 write_valid.titac5x1xsoundc.63
  ok 110 write_invalid.titac5x1xsoundc.63
  ok 111 event_missing.titac5x1xsoundc.63
  ok 112 event_spurious.titac5x1xsoundc.63
  ok 113 get_value.titac5x1xsoundc.62
  # titac5x1xsoundc.62 ASI_TX_CH2_EN Capture Switch
  ok 114 name.titac5x1xsoundc.62
  ok 115 write_default.titac5x1xsoundc.62
  ok 116 write_valid.titac5x1xsoundc.62
  ok 117 write_invalid.titac5x1xsoundc.62
  ok 118 event_missing.titac5x1xsoundc.62
  ok 119 event_spurious.titac5x1xsoundc.62
  ok 120 get_value.titac5x1xsoundc.61
  # titac5x1xsoundc.61 ASI_TX_CH1_EN Capture Switch
  ok 121 name.titac5x1xsoundc.61
  ok 122 write_default.titac5x1xsoundc.61
  ok 123 write_valid.titac5x1xsoundc.61
  ok 124 write_invalid.titac5x1xsoundc.61
  ok 125 event_missing.titac5x1xsoundc.61
  ok 126 event_spurious.titac5x1xsoundc.61
  ok 127 get_value.titac5x1xsoundc.60
  # titac5x1xsoundc.60 ADC1 Config
  ok 128 name.titac5x1xsoundc.60
  ok 129 write_default.titac5x1xsoundc.60
  ok 130 write_valid.titac5x1xsoundc.60
  ok 131 write_invalid.titac5x1xsoundc.60
  ok 132 event_missing.titac5x1xsoundc.60
  ok 133 event_spurious.titac5x1xsoundc.60
  ok 134 get_value.titac5x1xsoundc.59
  # titac5x1xsoundc.59 ADC1 Full-Scale
  ok 135 name.titac5x1xsoundc.59
  ok 136 write_default.titac5x1xsoundc.59
  ok 137 write_valid.titac5x1xsoundc.59
  ok 138 write_invalid.titac5x1xsoundc.59
  ok 139 event_missing.titac5x1xsoundc.59
  ok 140 event_spurious.titac5x1xsoundc.59
  ok 141 get_value.titac5x1xsoundc.58
  # titac5x1xsoundc.58 IN_CH4_EN Capture Switch
  ok 142 name.titac5x1xsoundc.58
  ok 143 write_default.titac5x1xsoundc.58
  ok 144 write_valid.titac5x1xsoundc.58
  ok 145 write_invalid.titac5x1xsoundc.58
  ok 146 event_missing.titac5x1xsoundc.58
  ok 147 event_spurious.titac5x1xsoundc.58
  ok 148 get_value.titac5x1xsoundc.57
  # titac5x1xsoundc.57 IN_CH3_EN Capture Switch
  ok 149 name.titac5x1xsoundc.57
  ok 150 write_default.titac5x1xsoundc.57
  ok 151 write_valid.titac5x1xsoundc.57
  ok 152 write_invalid.titac5x1xsoundc.57
  ok 153 event_missing.titac5x1xsoundc.57
  ok 154 event_spurious.titac5x1xsoundc.57
  ok 155 get_value.titac5x1xsoundc.56
  # titac5x1xsoundc.56 IN_CH2_EN Capture Switch
  ok 156 name.titac5x1xsoundc.56
  ok 157 write_default.titac5x1xsoundc.56
  ok 158 write_valid.titac5x1xsoundc.56
  ok 159 write_invalid.titac5x1xsoundc.56
  ok 160 event_missing.titac5x1xsoundc.56
  ok 161 event_spurious.titac5x1xsoundc.56
  ok 162 get_value.titac5x1xsoundc.55
  # titac5x1xsoundc.55 IN_CH1_EN Capture Switch
  ok 163 name.titac5x1xsoundc.55
  ok 164 write_default.titac5x1xsoundc.55
  ok 165 write_valid.titac5x1xsoundc.55
  ok 166 write_invalid.titac5x1xsoundc.55
  ok 167 event_missing.titac5x1xsoundc.55
  ok 168 event_spurious.titac5x1xsoundc.55
  ok 169 get_value.titac5x1xsoundc.54
  # titac5x1xsoundc.54 ASI_TX_CH8_CFG
  ok 170 name.titac5x1xsoundc.54
  ok 171 write_default.titac5x1xsoundc.54
  ok 172 write_valid.titac5x1xsoundc.54
  ok 173 write_invalid.titac5x1xsoundc.54
  ok 174 event_missing.titac5x1xsoundc.54
  ok 175 event_spurious.titac5x1xsoundc.54
  ok 176 get_value.titac5x1xsoundc.53
  # titac5x1xsoundc.53 ASI_TX_CH7_CFG
  ok 177 name.titac5x1xsoundc.53
  ok 178 write_default.titac5x1xsoundc.53
  ok 179 write_valid.titac5x1xsoundc.53
  ok 180 write_invalid.titac5x1xsoundc.53
  ok 181 event_missing.titac5x1xsoundc.53
  ok 182 event_spurious.titac5x1xsoundc.53
  ok 183 get_value.titac5x1xsoundc.52
  # titac5x1xsoundc.52 ASI_TX_CH6_CFG
  ok 184 name.titac5x1xsoundc.52
  ok 185 write_default.titac5x1xsoundc.52
  ok 186 write_valid.titac5x1xsoundc.52
  ok 187 write_invalid.titac5x1xsoundc.52
  ok 188 event_missing.titac5x1xsoundc.52
  ok 189 event_spurious.titac5x1xsoundc.52
  ok 190 get_value.titac5x1xsoundc.51
  # titac5x1xsoundc.51 ASI_TX_CH5_CFG
  ok 191 name.titac5x1xsoundc.51
  ok 192 write_default.titac5x1xsoundc.51
  ok 193 write_valid.titac5x1xsoundc.51
  ok 194 write_invalid.titac5x1xsoundc.51
  ok 195 event_missing.titac5x1xsoundc.51
  ok 196 event_spurious.titac5x1xsoundc.51
  ok 197 get_value.titac5x1xsoundc.50
  # titac5x1xsoundc.50 ADC1 Phase Capture Volume
  ok 198 name.titac5x1xsoundc.50
  ok 199 write_default.titac5x1xsoundc.50
  ok 200 write_valid.titac5x1xsoundc.50
  ok 201 write_invalid.titac5x1xsoundc.50
  ok 202 event_missing.titac5x1xsoundc.50
  ok 203 event_spurious.titac5x1xsoundc.50
  ok 204 get_value.titac5x1xsoundc.49
  # titac5x1xsoundc.49 ADC1 Fine Capture Volume
  ok 205 name.titac5x1xsoundc.49
  ok 206 write_default.titac5x1xsoundc.49
  ok 207 write_valid.titac5x1xsoundc.49
  ok 208 write_invalid.titac5x1xsoundc.49
  ok 209 event_missing.titac5x1xsoundc.49
  ok 210 event_spurious.titac5x1xsoundc.49
  ok 211 get_value.titac5x1xsoundc.48
  # titac5x1xsoundc.48 ADC1 Digital Capture Volume
  ok 212 name.titac5x1xsoundc.48
  ok 213 write_default.titac5x1xsoundc.48
  ok 214 write_valid.titac5x1xsoundc.48
  ok 215 write_invalid.titac5x1xsoundc.48
  ok 216 event_missing.titac5x1xsoundc.48
  ok 217 event_spurious.titac5x1xsoundc.48
  ok 218 get_value.titac5x1xsoundc.47
  # titac5x1xsoundc.47 ADC1 Audio BW
  ok 219 name.titac5x1xsoundc.47
  ok 220 write_default.titac5x1xsoundc.47
  ok 221 write_valid.titac5x1xsoundc.47
  ok 222 write_invalid.titac5x1xsoundc.47
  ok 223 event_missing.titac5x1xsoundc.47
  ok 224 event_spurious.titac5x1xsoundc.47
  ok 225 get_value.titac5x1xsoundc.46
  # titac5x1xsoundc.46 Record Decimation Filter
  ok 226 name.titac5x1xsoundc.46
  ok 227 write_default.titac5x1xsoundc.46
  ok 228 write_valid.titac5x1xsoundc.46
  ok 229 write_invalid.titac5x1xsoundc.46
  ok 230 event_missing.titac5x1xsoundc.46
  ok 231 event_spurious.titac5x1xsoundc.46
  ok 232 get_value.titac5x1xsoundc.45
  # titac5x1xsoundc.45 GPI1 GPI
  ok 233 name.titac5x1xsoundc.45
  # GPI1 GPI is not writeable
  ok 234 # SKIP write_default.titac5x1xsoundc.45
  # GPI1 GPI is not writeable
  ok 235 # SKIP write_valid.titac5x1xsoundc.45
  # GPI1 GPI is not writeable
  ok 236 # SKIP write_invalid.titac5x1xsoundc.45
  ok 237 event_missing.titac5x1xsoundc.45
  ok 238 event_spurious.titac5x1xsoundc.45
  ok 239 get_value.titac5x1xsoundc.44
  # titac5x1xsoundc.44 GPIO2 GPI
  ok 240 name.titac5x1xsoundc.44
  # GPIO2 GPI is not writeable
  ok 241 # SKIP write_default.titac5x1xsoundc.44
  # GPIO2 GPI is not writeable
  ok 242 # SKIP write_valid.titac5x1xsoundc.44
  # GPIO2 GPI is not writeable
  ok 243 # SKIP write_invalid.titac5x1xsoundc.44
  ok 244 event_missing.titac5x1xsoundc.44
  ok 245 event_spurious.titac5x1xsoundc.44
  ok 246 get_value.titac5x1xsoundc.43
  # titac5x1xsoundc.43 PDM4 Phase Capture Volume
  ok 247 name.titac5x1xsoundc.43
  ok 248 write_default.titac5x1xsoundc.43
  ok 249 write_valid.titac5x1xsoundc.43
  ok 250 write_invalid.titac5x1xsoundc.43
  ok 251 event_missing.titac5x1xsoundc.43
  ok 252 event_spurious.titac5x1xsoundc.43
  ok 253 get_value.titac5x1xsoundc.42
  # titac5x1xsoundc.42 PDM3 Phase Capture Volume
  ok 254 name.titac5x1xsoundc.42
  ok 255 write_default.titac5x1xsoundc.42
  ok 256 write_valid.titac5x1xsoundc.42
  ok 257 write_invalid.titac5x1xsoundc.42
  ok 258 event_missing.titac5x1xsoundc.42
  ok 259 event_spurious.titac5x1xsoundc.42
  ok 260 get_value.titac5x1xsoundc.41
  # titac5x1xsoundc.41 PDM4 Fine Capture Volume
  ok 261 name.titac5x1xsoundc.41
  ok 262 write_default.titac5x1xsoundc.41
  ok 263 write_valid.titac5x1xsoundc.41
  ok 264 write_invalid.titac5x1xsoundc.41
  ok 265 event_missing.titac5x1xsoundc.41
  ok 266 event_spurious.titac5x1xsoundc.41
  ok 267 get_value.titac5x1xsoundc.40
  # titac5x1xsoundc.40 PDM3 Fine Capture Volume
  ok 268 name.titac5x1xsoundc.40
  ok 269 write_default.titac5x1xsoundc.40
  ok 270 write_valid.titac5x1xsoundc.40
  ok 271 write_invalid.titac5x1xsoundc.40
  ok 272 event_missing.titac5x1xsoundc.40
  ok 273 event_spurious.titac5x1xsoundc.40
  ok 274 get_value.titac5x1xsoundc.39
  # titac5x1xsoundc.39 PDM4 Digital Capture Volume
  ok 275 name.titac5x1xsoundc.39
  ok 276 write_default.titac5x1xsoundc.39
  ok 277 write_valid.titac5x1xsoundc.39
  ok 278 write_invalid.titac5x1xsoundc.39
  ok 279 event_missing.titac5x1xsoundc.39
  ok 280 event_spurious.titac5x1xsoundc.39
  ok 281 get_value.titac5x1xsoundc.38
  # titac5x1xsoundc.38 PDM3 Digital Capture Volume
  ok 282 name.titac5x1xsoundc.38
  ok 283 write_default.titac5x1xsoundc.38
  ok 284 write_valid.titac5x1xsoundc.38
  ok 285 write_invalid.titac5x1xsoundc.38
  ok 286 event_missing.titac5x1xsoundc.38
  ok 287 event_spurious.titac5x1xsoundc.38
  ok 288 get_value.titac5x1xsoundc.37
  # titac5x1xsoundc.37 PDM2 Phase Capture Volume
  ok 289 name.titac5x1xsoundc.37
  ok 290 write_default.titac5x1xsoundc.37
  ok 291 write_valid.titac5x1xsoundc.37
  ok 292 write_invalid.titac5x1xsoundc.37
  ok 293 event_missing.titac5x1xsoundc.37
  ok 294 event_spurious.titac5x1xsoundc.37
  ok 295 get_value.titac5x1xsoundc.36
  # titac5x1xsoundc.36 PDM1 Phase Capture Volume
  ok 296 name.titac5x1xsoundc.36
  ok 297 write_default.titac5x1xsoundc.36
  ok 298 write_valid.titac5x1xsoundc.36
  ok 299 write_invalid.titac5x1xsoundc.36
  ok 300 event_missing.titac5x1xsoundc.36
  ok 301 event_spurious.titac5x1xsoundc.36
  ok 302 get_value.titac5x1xsoundc.35
  # titac5x1xsoundc.35 PDM2 Fine Capture Volume
  ok 303 name.titac5x1xsoundc.35
  ok 304 write_default.titac5x1xsoundc.35
  ok 305 write_valid.titac5x1xsoundc.35
  ok 306 write_invalid.titac5x1xsoundc.35
  ok 307 event_missing.titac5x1xsoundc.35
  ok 308 event_spurious.titac5x1xsoundc.35
  ok 309 get_value.titac5x1xsoundc.34
  # titac5x1xsoundc.34 PDM1 Fine Capture Volume
  ok 310 name.titac5x1xsoundc.34
  ok 311 write_default.titac5x1xsoundc.34
  ok 312 write_valid.titac5x1xsoundc.34
  ok 313 write_invalid.titac5x1xsoundc.34
  ok 314 event_missing.titac5x1xsoundc.34
  ok 315 event_spurious.titac5x1xsoundc.34
  ok 316 get_value.titac5x1xsoundc.33
  # titac5x1xsoundc.33 PDM2 Digital Capture Volume
  ok 317 name.titac5x1xsoundc.33
  ok 318 write_default.titac5x1xsoundc.33
  ok 319 write_valid.titac5x1xsoundc.33
  ok 320 write_invalid.titac5x1xsoundc.33
  ok 321 event_missing.titac5x1xsoundc.33
  ok 322 event_spurious.titac5x1xsoundc.33
  ok 323 get_value.titac5x1xsoundc.32
  # titac5x1xsoundc.32 PDM1 Digital Capture Volume
  ok 324 name.titac5x1xsoundc.32
  ok 325 write_default.titac5x1xsoundc.32
  ok 326 write_valid.titac5x1xsoundc.32
  ok 327 write_invalid.titac5x1xsoundc.32
  ok 328 event_missing.titac5x1xsoundc.32
  ok 329 event_spurious.titac5x1xsoundc.32
  ok 330 get_value.titac5x1xsoundc.31
  # titac5x1xsoundc.31 PDM Clk Divider
  ok 331 name.titac5x1xsoundc.31
  ok 332 write_default.titac5x1xsoundc.31
  ok 333 write_valid.titac5x1xsoundc.31
  ok 334 write_invalid.titac5x1xsoundc.31
  ok 335 event_missing.titac5x1xsoundc.31
  ok 336 event_spurious.titac5x1xsoundc.31
  ok 337 get_value.titac5x1xsoundc.30
  # titac5x1xsoundc.30 DAC2 Audio BW
  ok 338 name.titac5x1xsoundc.30
  ok 339 write_default.titac5x1xsoundc.30
  ok 340 write_valid.titac5x1xsoundc.30
  ok 341 write_invalid.titac5x1xsoundc.30
  ok 342 event_missing.titac5x1xsoundc.30
  ok 343 event_spurious.titac5x1xsoundc.30
  ok 344 get_value.titac5x1xsoundc.29
  # titac5x1xsoundc.29 DAC2 CHB Gain Calibration Playback Volume
  ok 345 name.titac5x1xsoundc.29
  ok 346 write_default.titac5x1xsoundc.29
  ok 347 write_valid.titac5x1xsoundc.29
  ok 348 write_invalid.titac5x1xsoundc.29
  ok 349 event_missing.titac5x1xsoundc.29
  ok 350 event_spurious.titac5x1xsoundc.29
  ok 351 get_value.titac5x1xsoundc.28
  # titac5x1xsoundc.28 DAC2 CHA Gain Calibration Playback Volume
  ok 352 name.titac5x1xsoundc.28
  ok 353 write_default.titac5x1xsoundc.28
  ok 354 write_valid.titac5x1xsoundc.28
  ok 355 write_invalid.titac5x1xsoundc.28
  ok 356 event_missing.titac5x1xsoundc.28
  ok 357 event_spurious.titac5x1xsoundc.28
  ok 358 get_value.titac5x1xsoundc.27
  # titac5x1xsoundc.27 DAC2 CHB Digital Playback Volume
  ok 359 name.titac5x1xsoundc.27
  ok 360 write_default.titac5x1xsoundc.27
  ok 361 write_valid.titac5x1xsoundc.27
  ok 362 write_invalid.titac5x1xsoundc.27
  ok 363 event_missing.titac5x1xsoundc.27
  ok 364 event_spurious.titac5x1xsoundc.27
  ok 365 get_value.titac5x1xsoundc.26
  # titac5x1xsoundc.26 DAC2 CHA Digital Playback Volume
  ok 366 name.titac5x1xsoundc.26
  ok 367 write_default.titac5x1xsoundc.26
  ok 368 write_valid.titac5x1xsoundc.26
  ok 369 write_invalid.titac5x1xsoundc.26
  ok 370 event_missing.titac5x1xsoundc.26
  ok 371 event_spurious.titac5x1xsoundc.26
  ok 372 get_value.titac5x1xsoundc.25
  # titac5x1xsoundc.25 OUT2M Analog Level Playback Volume
  ok 373 name.titac5x1xsoundc.25
  ok 374 write_default.titac5x1xsoundc.25
  ok 375 write_valid.titac5x1xsoundc.25
  ok 376 write_invalid.titac5x1xsoundc.25
  ok 377 event_missing.titac5x1xsoundc.25
  ok 378 event_spurious.titac5x1xsoundc.25
  ok 379 get_value.titac5x1xsoundc.24
  # titac5x1xsoundc.24 OUT2P Analog Level Playback Volume
  ok 380 name.titac5x1xsoundc.24
  ok 381 write_default.titac5x1xsoundc.24
  ok 382 write_valid.titac5x1xsoundc.24
  ok 383 write_invalid.titac5x1xsoundc.24
  ok 384 event_missing.titac5x1xsoundc.24
  ok 385 event_spurious.titac5x1xsoundc.24
  ok 386 get_value.titac5x1xsoundc.23
  # titac5x1xsoundc.23 ADC2 Phase Capture Volume
  ok 387 name.titac5x1xsoundc.23
  ok 388 write_default.titac5x1xsoundc.23
  ok 389 write_valid.titac5x1xsoundc.23
  ok 390 write_invalid.titac5x1xsoundc.23
  ok 391 event_missing.titac5x1xsoundc.23
  ok 392 event_spurious.titac5x1xsoundc.23
  ok 393 get_value.titac5x1xsoundc.22
  # titac5x1xsoundc.22 ADC2 Fine Capture Volume
  ok 394 name.titac5x1xsoundc.22
  ok 395 write_default.titac5x1xsoundc.22
  ok 396 write_valid.titac5x1xsoundc.22
  ok 397 write_invalid.titac5x1xsoundc.22
  ok 398 event_missing.titac5x1xsoundc.22
  ok 399 event_spurious.titac5x1xsoundc.22
  ok 400 get_value.titac5x1xsoundc.21
  # titac5x1xsoundc.21 ADC2 Digital Capture Volume
  ok 401 name.titac5x1xsoundc.21
  ok 402 write_default.titac5x1xsoundc.21
  ok 403 write_valid.titac5x1xsoundc.21
  ok 404 write_invalid.titac5x1xsoundc.21
  ok 405 event_missing.titac5x1xsoundc.21
  ok 406 event_spurious.titac5x1xsoundc.21
  ok 407 get_value.titac5x1xsoundc.20
  # titac5x1xsoundc.20 ADC2 Audio BW
  ok 408 name.titac5x1xsoundc.20
  ok 409 write_default.titac5x1xsoundc.20
  ok 410 write_valid.titac5x1xsoundc.20
  ok 411 write_invalid.titac5x1xsoundc.20
  ok 412 event_missing.titac5x1xsoundc.20
  ok 413 event_spurious.titac5x1xsoundc.20
  ok 414 get_value.titac5x1xsoundc.19
  # titac5x1xsoundc.19 OUT_CH4_EN Playback Switch
  ok 415 name.titac5x1xsoundc.19
  ok 416 write_default.titac5x1xsoundc.19
  ok 417 write_valid.titac5x1xsoundc.19
  ok 418 write_invalid.titac5x1xsoundc.19
  ok 419 event_missing.titac5x1xsoundc.19
  ok 420 event_spurious.titac5x1xsoundc.19
  ok 421 get_value.titac5x1xsoundc.18
  # titac5x1xsoundc.18 OUT_CH3_EN Playback Switch
  ok 422 name.titac5x1xsoundc.18
  ok 423 write_default.titac5x1xsoundc.18
  ok 424 write_valid.titac5x1xsoundc.18
  ok 425 write_invalid.titac5x1xsoundc.18
  ok 426 event_missing.titac5x1xsoundc.18
  ok 427 event_spurious.titac5x1xsoundc.18
  ok 428 get_value.titac5x1xsoundc.17
  # titac5x1xsoundc.17 OUT_CH2_EN Playback Switch
  ok 429 name.titac5x1xsoundc.17
  ok 430 write_default.titac5x1xsoundc.17
  ok 431 write_valid.titac5x1xsoundc.17
  ok 432 write_invalid.titac5x1xsoundc.17
  ok 433 event_missing.titac5x1xsoundc.17
  ok 434 event_spurious.titac5x1xsoundc.17
  ok 435 get_value.titac5x1xsoundc.16
  # titac5x1xsoundc.16 OUT_CH1_EN Playback Switch
  ok 436 name.titac5x1xsoundc.16
  ok 437 write_default.titac5x1xsoundc.16
  ok 438 write_valid.titac5x1xsoundc.16
  ok 439 write_invalid.titac5x1xsoundc.16
  ok 440 event_missing.titac5x1xsoundc.16
  ok 441 event_spurious.titac5x1xsoundc.16
  ok 442 get_value.titac5x1xsoundc.15
  # titac5x1xsoundc.15 ASI_RX_CH8_EN Playback
  ok 443 name.titac5x1xsoundc.15
  ok 444 write_default.titac5x1xsoundc.15
  ok 445 write_valid.titac5x1xsoundc.15
  ok 446 write_invalid.titac5x1xsoundc.15
  ok 447 event_missing.titac5x1xsoundc.15
  ok 448 event_spurious.titac5x1xsoundc.15
  ok 449 get_value.titac5x1xsoundc.14
  # titac5x1xsoundc.14 ASI_RX_CH7_EN Playback
  ok 450 name.titac5x1xsoundc.14
  ok 451 write_default.titac5x1xsoundc.14
  ok 452 write_valid.titac5x1xsoundc.14
  ok 453 write_invalid.titac5x1xsoundc.14
  ok 454 event_missing.titac5x1xsoundc.14
  ok 455 event_spurious.titac5x1xsoundc.14
  ok 456 get_value.titac5x1xsoundc.13
  # titac5x1xsoundc.13 ASI_RX_CH6_EN Playback
  ok 457 name.titac5x1xsoundc.13
  ok 458 write_default.titac5x1xsoundc.13
  ok 459 write_valid.titac5x1xsoundc.13
  ok 460 write_invalid.titac5x1xsoundc.13
  ok 461 event_missing.titac5x1xsoundc.13
  ok 462 event_spurious.titac5x1xsoundc.13
  ok 463 get_value.titac5x1xsoundc.12
  # titac5x1xsoundc.12 ASI_RX_CH5_EN Playback
  ok 464 name.titac5x1xsoundc.12
  ok 465 write_default.titac5x1xsoundc.12
  ok 466 write_valid.titac5x1xsoundc.12
  ok 467 write_invalid.titac5x1xsoundc.12
  ok 468 event_missing.titac5x1xsoundc.12
  ok 469 event_spurious.titac5x1xsoundc.12
  ok 470 get_value.titac5x1xsoundc.11
  # titac5x1xsoundc.11 ASI_RX_CH4_EN Playback Switch
  ok 471 name.titac5x1xsoundc.11
  ok 472 write_default.titac5x1xsoundc.11
  ok 473 write_valid.titac5x1xsoundc.11
  ok 474 write_invalid.titac5x1xsoundc.11
  ok 475 event_missing.titac5x1xsoundc.11
  ok 476 event_spurious.titac5x1xsoundc.11
  ok 477 get_value.titac5x1xsoundc.10
  # titac5x1xsoundc.10 ASI_RX_CH3_EN Playback Switch
  ok 478 name.titac5x1xsoundc.10
  ok 479 write_default.titac5x1xsoundc.10
  ok 480 write_valid.titac5x1xsoundc.10
  ok 481 write_invalid.titac5x1xsoundc.10
  ok 482 event_missing.titac5x1xsoundc.10
  ok 483 event_spurious.titac5x1xsoundc.10
  ok 484 get_value.titac5x1xsoundc.9
  # titac5x1xsoundc.9 DAC1 CHB Gain Calibration Playback Volume
  ok 485 name.titac5x1xsoundc.9
  ok 486 write_default.titac5x1xsoundc.9
  ok 487 write_valid.titac5x1xsoundc.9
  ok 488 write_invalid.titac5x1xsoundc.9
  ok 489 event_missing.titac5x1xsoundc.9
  ok 490 event_spurious.titac5x1xsoundc.9
  ok 491 get_value.titac5x1xsoundc.8
  # titac5x1xsoundc.8 DAC1 CHA Gain Calibration Playback Volume
  ok 492 name.titac5x1xsoundc.8
  ok 493 write_default.titac5x1xsoundc.8
  ok 494 write_valid.titac5x1xsoundc.8
  ok 495 write_invalid.titac5x1xsoundc.8
  ok 496 event_missing.titac5x1xsoundc.8
  ok 497 event_spurious.titac5x1xsoundc.8
  ok 498 get_value.titac5x1xsoundc.7
  # titac5x1xsoundc.7 DAC1 CHB Digital Playback Volume
  ok 499 name.titac5x1xsoundc.7
  ok 500 write_default.titac5x1xsoundc.7
  ok 501 write_valid.titac5x1xsoundc.7
  ok 502 write_invalid.titac5x1xsoundc.7
  ok 503 event_missing.titac5x1xsoundc.7
  ok 504 event_spurious.titac5x1xsoundc.7
  ok 505 get_value.titac5x1xsoundc.6
  # titac5x1xsoundc.6 DAC1 CHA Digital Playback Volume
  ok 506 name.titac5x1xsoundc.6
  ok 507 write_default.titac5x1xsoundc.6
  ok 508 write_valid.titac5x1xsoundc.6
  ok 509 write_invalid.titac5x1xsoundc.6
  ok 510 event_missing.titac5x1xsoundc.6
  ok 511 event_spurious.titac5x1xsoundc.6
  ok 512 get_value.titac5x1xsoundc.5
  # titac5x1xsoundc.5 OUT1M Analog Level Playback Volume
  ok 513 name.titac5x1xsoundc.5
  ok 514 write_default.titac5x1xsoundc.5
  ok 515 write_valid.titac5x1xsoundc.5
  ok 516 write_invalid.titac5x1xsoundc.5
  ok 517 event_missing.titac5x1xsoundc.5
  ok 518 event_spurious.titac5x1xsoundc.5
  ok 519 get_value.titac5x1xsoundc.4
  # titac5x1xsoundc.4 OUT1P Analog Level Playback Volume
  ok 520 name.titac5x1xsoundc.4
  ok 521 write_default.titac5x1xsoundc.4
  ok 522 write_valid.titac5x1xsoundc.4
  ok 523 write_invalid.titac5x1xsoundc.4
  ok 524 event_missing.titac5x1xsoundc.4
  ok 525 event_spurious.titac5x1xsoundc.4
  ok 526 get_value.titac5x1xsoundc.3
  # titac5x1xsoundc.3 DAC1 Audio BW
  ok 527 name.titac5x1xsoundc.3
  ok 528 write_default.titac5x1xsoundc.3
  ok 529 write_valid.titac5x1xsoundc.3
  ok 530 write_invalid.titac5x1xsoundc.3
  ok 531 event_missing.titac5x1xsoundc.3
  ok 532 event_spurious.titac5x1xsoundc.3
  ok 533 get_value.titac5x1xsoundc.2
  # titac5x1xsoundc.2 Playback Decimation Filter
  ok 534 name.titac5x1xsoundc.2
  ok 535 write_default.titac5x1xsoundc.2
  ok 536 write_valid.titac5x1xsoundc.2
  ok 537 write_invalid.titac5x1xsoundc.2
  ok 538 event_missing.titac5x1xsoundc.2
  ok 539 event_spurious.titac5x1xsoundc.2
  ok 540 get_value.titac5x1xsoundc.1
  # titac5x1xsoundc.1 ADC2 Common-mode Tolerance
  ok 541 name.titac5x1xsoundc.1
  ok 542 write_default.titac5x1xsoundc.1
  ok 543 write_valid.titac5x1xsoundc.1
  ok 544 write_invalid.titac5x1xsoundc.1
  ok 545 event_missing.titac5x1xsoundc.1
  ok 546 event_spurious.titac5x1xsoundc.1
  ok 547 get_value.titac5x1xsoundc.0
  # titac5x1xsoundc.0 ADC1 Common-mode Tolerance
  ok 548 name.titac5x1xsoundc.0
  ok 549 write_default.titac5x1xsoundc.0
  ok 550 write_valid.titac5x1xsoundc.0
  ok 551 write_invalid.titac5x1xsoundc.0
  ok 552 event_missing.titac5x1xsoundc.0
  ok 553 event_spurious.titac5x1xsoundc.0
  # 6 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
  # Totals: pass:547 fail:0 xfail:0 xpass:0 skip:6 error:0

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

Niranjan H Y (4):
  ASoc: tac5x1x: add codec driver tac5x1x family
  Asoc: tac5x1x: document tac5x1x codec
  Asoc: pcm6240: remove support for taac5x1x family
  ASoc: pcm6240: dt-bindings device support list update

 .../devicetree/bindings/sound/ti,pcm6240.yaml |   10 -
 .../devicetree/bindings/sound/ti,tac5x1x.yaml |  248 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/pcm6240.c                    |  124 +-
 sound/soc/codecs/pcm6240.h                    |    4 -
 sound/soc/codecs/tac5x1x-i2c.c                | 2225 +++++++++++++++++
 sound/soc/codecs/tac5x1x.h                    |  300 +++
 8 files changed, 2790 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
 create mode 100644 sound/soc/codecs/tac5x1x-i2c.c
 create mode 100644 sound/soc/codecs/tac5x1x.h

--
2.45.2

