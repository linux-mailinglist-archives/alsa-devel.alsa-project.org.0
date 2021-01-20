Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874B2FD5EC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 17:47:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C39317DA;
	Wed, 20 Jan 2021 17:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C39317DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611161247;
	bh=Knb4p7kFd1ZigXwPDVJXlzeNF3Wf5aHrKyXWqZjPfuI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NtYRoiSV+ubRXLi7m04Oujykd40FSZ/MGjgHOAxZfGYdVogl6mW3pLVtQWTYWntms
	 RRLTXvv2WMAxsK9c19uaTDBlyCMq4EU8ICZsY0o3B/Z8FM4xh/ZXy7YA/tJcXijIdP
	 bpW7b0VM77zJDieTGOHP6G/R9wtGZcLB7WgtxpY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9404DF80164;
	Wed, 20 Jan 2021 17:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A51EAF8016E; Wed, 20 Jan 2021 17:45:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C2FF80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 17:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C2FF80164
IronPort-SDR: 3cDuyc3i+Nku+J3v/Y2V5BoiBmYhC73XwLpKPhKU5OhVPiJ0ICuRJi1hy6J2Rj7UxCID+oslrU
 7BPA/Nkn5+og==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="243208041"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="243208041"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 08:45:42 -0800
IronPort-SDR: jOQpdhF77cakpHtUSgc9r40S1D8+/msWUO7+eagZo6MLNNrkJO1lYHyeeq0tJq2TWBOUDqlzE+
 M3XmMiIUTMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="402798582"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2021 08:45:39 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 16:45:38 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 20 Jan 2021 16:45:38 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?xYF1a2FzeiBNYWpjemFr?= <lma@semihalf.com>
Subject: RE: [PATCH v2] ASoC: Intel: Skylake: Check the kcontrol against NULL
Thread-Topic: [PATCH v2] ASoC: Intel: Skylake: Check the kcontrol against NULL
Thread-Index: AQHW1HWlBDRR5udg2US7JjUHUSX5h6okBMqAgAzZ2oCAAAxcgIAAAbqwgAABYaA=
Date: Wed, 20 Jan 2021 16:45:38 +0000
Message-ID: <4774f65a7f2f464781a45790c8934a62@intel.com>
References: <20201210121438.7718-1-lma@semihalf.com>
 <20201217130439.141943-1-lma@semihalf.com>
 <CAFJ_xbprw7UKREWgRAq3dDAA9oC_3cWoozn5pCY8w9By4dASag@mail.gmail.com>
 <CAFJ_xbrvr7jcCB57MPwzXf=oC5OYT5KUBkcqHYyOYH=a5njfSA@mail.gmail.com>
 <8c22c415-1807-b673-20e3-bc8d7f4c05b7@linux.intel.com>
 <371e612ac59c458cad1bafb82ca09c9f@intel.com>
In-Reply-To: <371e612ac59c458cad1bafb82ca09c9f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@google.com>
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

T24gMjAyMS0wMS0yMCA1OjQxIFBNLCBSb2pld3NraSwgQ2V6YXJ5IHdyb3RlOg0KPiANCj4gSnVz
dCBjaGVja2VkIHRoZSBoaXN0b3J5IGJlaGluZCB0aGlzLiBBbmQgbXVzdCBzYXksIEkgbGlrZWQg
UmljYXJkbydzDQo+IHZlcnNpb24gYmV0dGVyLiBFeGNlcHQgZm9yIHRoZSAiPSB7fTsiIGJpdCB3
aGljaCBNYXJrIGFscmVhZHkgcG9pbnRlZA0KPiBvdXQgLSBpdCBzaG91bGQgYmUgYSBzZXBhcmF0
ZSBmaXggLSBpdCdzIHNpbXBseSBtb3JlIG9wdGlvbmFsDQoNCk1lYW50IHRvIHNheTogb3B0aW1h
bC4NCg0K
