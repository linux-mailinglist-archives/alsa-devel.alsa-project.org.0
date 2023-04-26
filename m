Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8476F2ED6
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D539F17E0;
	Mon,  1 May 2023 08:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D539F17E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923493;
	bh=AjqT0UAvv64kevTBCUUMW4bqoiJrNpOZOTGXVCrld5A=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JDQ5yAgIpc+XDEhVNLtORnMTe5e4vy5aCKfbLvd4Xv2nwSaRAG83nGrVENgJHLTg6
	 2gGLQ0duvVpBOSMF2bmhdTLUPIdehq4Xp49jmuE1iYLL8euKRi88eaPgFHs2fM0HsL
	 oK7/DGcYrWHrPWyglG6g6v2eVr+8mdWHlKACJQ8I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2EAF805AC;
	Mon,  1 May 2023 08:40:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2745F80236; Wed, 26 Apr 2023 05:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from gfmail1.glenfly.com (gfmail1.glenfly.com [113.31.180.35])
	by alsa1.perex.cz (Postfix) with ESMTP id C0695F80104
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 05:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0695F80104
X-ASG-Debug-ID: 1682479824-196b4b151014a360001-UKjUFf
Received: from GFSHEXCH01.glenfly.com (GFSHEXCH01.glenfly.com [10.5.250.51])
 by gfmail1.glenfly.com with ESMTP id GWavQAfSndyKb7II;
 Wed, 26 Apr 2023 11:30:24 +0800 (CST)
X-Barracuda-Envelope-From: ReaperLiOC@glenfly.com
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.51
Received: from GFSHEXCH03.glenfly.com (10.5.250.53) by GFSHEXCH01.glenfly.com
 (10.5.250.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 26 Apr
 2023 11:30:51 +0800
Received: from GFSHEXCH03.glenfly.com ([fe80::1cb2:fbd4:8e34:2eb5]) by
 GFSHEXCH03.glenfly.com ([fe80::1cb2:fbd4:8e34:2eb5%4]) with mapi id
 15.01.2507.023; Wed, 26 Apr 2023 11:30:48 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.51
From: Reaper Li_OC <ReaperLiOC@glenfly.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI
 Codec Vendor IDs.
Thread-Topic: [PATCH v2] ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI
 Codec Vendor IDs.
X-ASG-Orig-Subj: Re: [PATCH v2] ALSA: hda: Glenfly: add HD Audio PCI IDs and
 HDMI
 Codec Vendor IDs.
Thread-Index: AQHZd+9+IH8ECITzIk+wuN5IV44p4Q==
Date: Wed, 26 Apr 2023 03:30:48 +0000
Message-ID: <20230426033609.GA18215@sqa-PC>
References: <20230425101524.8020-1-reaperlioc@glenfly.com>
 <875y9kujue.wl-tiwai@suse.de>
In-Reply-To: <875y9kujue.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.30.16.40]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4B08414F2993B34693714F7436D19FF2@glenfly.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: GFSHEXCH01.glenfly.com[10.5.250.51]
X-Barracuda-Start-Time: 1682479824
X-Barracuda-URL: https://10.5.252.51:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at glenfly.com
X-Barracuda-Scan-Msg-Size: 177
X-Barracuda-Bayes: SPAM GLOBAL 0.9990 1.0000 4.3308
X-Barracuda-Spam-Score: 4.33
X-Barracuda-Spam-Status: No,
 SCORE=4.33 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0
 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.107938
	Rule breakdown below
	 pts rule name              description
	---- ----------------------
 --------------------------------------------------
X-MailFrom: ReaperLiOC@glenfly.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EBPXRRFAV7ZJUV454INL32P4MCPZIFWN
X-Message-ID-Hash: EBPXRRFAV7ZJUV454INL32P4MCPZIFWN
X-Mailman-Approved-At: Mon, 01 May 2023 06:40:38 +0000
CC: "Jason Tao(SH-RD)" <JasonTao@glenfly.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBPXRRFAV7ZJUV454INL32P4MCPZIFWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> This is almost fine, but could just correct minor warnings
> scripts/checkpatch.pl complains?

Appreciate for your help, have fixed the warnings and resend the v3
patch.=
