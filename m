Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B123B8D2970
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 02:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0C3E83B;
	Wed, 29 May 2024 02:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0C3E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716942564;
	bh=sEBNomMwsCYJ4cuga3VDRHi4EWD1S0fTZ/rV4E55RNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IzndBSibm7RdmUan7/8eK9bregHlzvGAhJ9T3mpel32jpB642VKloXA7MEzlQqC49
	 IkoBfXyan0oSU8mVftoc4sxf5v7kSbttOL4PI012/IHrEwC0PU5y4BgNfUIC5L5sAI
	 lbARk7gibx+7afsc8C6HDZstdsK3/t2UBpbBr33w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD705F800E9; Wed, 29 May 2024 02:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3608F80588;
	Wed, 29 May 2024 02:28:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06D48F80149; Wed, 29 May 2024 02:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CACA2F800BA
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 02:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACA2F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hOu6gZBe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716942371; x=1748478371;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=I6moV8IY6cVI829cueITa2b4XrFX8XzJD439g2OWzmM=;
  b=hOu6gZBeV5vDuGY6tA+5JNrtLdXjLAZ6gZHvXoQV9fO9eVPNyoOHa4fY
   jZ7Rkoy/yclUNPivUUS8VNfkAMuREAO8JigVXKJj3k9+Gr/6JfTPN204b
   mcy5xc1hxSgoql5N/V/PDoQxdO7qAcfNYkRrRxU25nB3C/HvcFcvXhLQU
   QC/cmgqqv/hHTE2cqO3U5LJwNvpMiHrWWjCtgUtYR3l90R97BdLcw3dMA
   VfG4qKs9cxdoGEdk67UsuMOqPzEXeXFShyhZHl/6FHNO7Ugo/12QN59uB
   M33jk9/Y5BKOs/nRge7sTMv0HLhrayXcAJgd2Ty9ZnMDthDQoS8eUxJH3
   g==;
X-CSE-ConnectionGUID: ZnbGaZiYRMOxZxf3nLEviA==
X-CSE-MsgGUID: hHcmYbDuSZi+qw/W1bW12g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13168834"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208,217";a="13168834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 17:26:05 -0700
X-CSE-ConnectionGUID: koa+RCf2RsSm7DwQHPGY9Q==
X-CSE-MsgGUID: z7osg5J1SLyc4GPP5APiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208,217";a="40075242"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.98])
 ([10.246.104.98])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 17:26:03 -0700
Message-ID: <446f90c8-87de-4a9f-8f40-ba544754dd15@linux.intel.com>
Date: Wed, 29 May 2024 08:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] ASoC: Intel: sof_sdw: Add quirks from some new Dell
 laptops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
 <20240527193552.165567-12-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240527193552.165567-12-pierre-louis.bossart@linux.intel.com>
Message-ID-Hash: EVTV7R3EBNBQTZBLS3Q5CPUI2RNWX5YN
X-Message-ID-Hash: EVTV7R3EBNBQTZBLS3Q5CPUI2RNWX5YN
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVTV7R3EBNBQTZBLS3Q5CPUI2RNWX5YN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA1LzI4LzIwMjQgMzozNSBBTSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IEZy
b206IENoYXJsZXMgS2VlcGF4PGNrZWVwYXhAb3BlbnNvdXJjZS5jaXJydXMuY29tPg0KPg0KPiBB
ZGQgcXVpcmtzIGZvciBzb21lIG5ldyBEZWxsIGxhcHRvcHMgdXNpbmcgY3M0Mmw0MydzIHNwZWFr
ZXIgb3V0cHV0cy4NCg0KDQpQbGVhc2UgaG9sZCBvbi4gRGVsbCBqdXN0IGluZm9ybWVkIHRoYXQg
dGhleSBoYXZlIG5vdCBtYWRlIGZpbmFsIGRlY2lzaW9uDQoNCnRvIHVzZSBDaXJydXMgTG9naWMg
Y29kZWMgZm9yIHNvbWUgb2YgdGhlIFNLVXMuDQoNClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5j
ZS4NCg0KDQo+DQo+IFJldmlld2VkLWJ5OiBCYXJkIExpYW88eXVuZy1jaHVhbi5saWFvQGxpbnV4
LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxlcyBLZWVwYXg8Y2tlZXBheEBvcGVu
c291cmNlLmNpcnJ1cy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0
PHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICAgc291bmQv
c29jL2ludGVsL2JvYXJkcy9zb2Zfc2R3LmMgfCA4OCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9zZHcuYyBiL3NvdW5kL3NvYy9pbnRl
bC9ib2FyZHMvc29mX3Nkdy5jDQo+IGluZGV4IGI2NDZiMzJkZDMxMS4uNTAxNWQzZWQ2YTljIDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9zZHcuYw0KPiArKysgYi9z
b3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9zZHcuYw0KPiBAQCAtNDYxLDYgKzQ2MSwzMCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgc29mX3Nkd19xdWlya190YWJsZVtdID0g
ew0KPiAgIAkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikoU09GX1NEV19UR0xfSERNSSB8DQo+ICAg
CQkJCQlSVDcxMV9KRDIpLA0KPiAgIAl9LA0KPiArCXsNCj4gKwkJLmNhbGxiYWNrID0gc29mX3Nk
d19xdWlya19jYiwNCj4gKwkJLm1hdGNoZXMgPSB7DQo+ICsJCQlETUlfTUFUQ0goRE1JX1NZU19W
RU5ET1IsICJEZWxsIEluYyIpLA0KPiArCQkJRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1NL
VSwgIjBDRjYiKQ0KPiArCQl9LA0KPiArCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKShTT0ZfQ09E
RUNfU1BLUiksDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5jYWxsYmFjayA9IHNvZl9zZHdfcXVpcmtf
Y2IsDQo+ICsJCS5tYXRjaGVzID0gew0KPiArCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAi
RGVsbCBJbmMiKSwNCj4gKwkJCURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9TS1UsICIwQ0Y5
IikNCj4gKwkJfSwNCj4gKwkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikoU09GX0NPREVDX1NQS1Ip
LA0KPiArCX0sDQo+ICsJew0KPiArCQkuY2FsbGJhY2sgPSBzb2Zfc2R3X3F1aXJrX2NiLA0KPiAr
CQkubWF0Y2hlcyA9IHsNCj4gKwkJCURNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkRlbGwgSW5j
IiksDQo+ICsJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfU0tVLCAiMENGQSIpDQo+ICsJ
CX0sDQo+ICsJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopKFNPRl9DT0RFQ19TUEtSKSwNCj4gKwl9
LA0KPiAgIAkvKiBNZXRlb3JMYWtlIGRldmljZXMgKi8NCj4gICAJew0KPiAgIAkJLmNhbGxiYWNr
ID0gc29mX3Nkd19xdWlya19jYiwNCj4gQEAgLTQ5NSw2ICs1MTksNDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkbWlfc3lzdGVtX2lkIHNvZl9zZHdfcXVpcmtfdGFibGVbXSA9IHsNCj4gICAJCX0s
DQo+ICAgCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKShSVDcxMV9KRDIpLA0KPiAgIAl9LA0KPiAr
CXsNCj4gKwkJLmNhbGxiYWNrID0gc29mX3Nkd19xdWlya19jYiwNCj4gKwkJLm1hdGNoZXMgPSB7
DQo+ICsJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJEZWxsIEluYyIpLA0KPiArCQkJRE1J
X0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1NLVSwgIjBDRTgiKQ0KPiArCQl9LA0KPiArCQkuZHJp
dmVyX2RhdGEgPSAodm9pZCAqKShTT0ZfQ09ERUNfU1BLUiksDQo+ICsJfSwNCj4gKwl7DQo+ICsJ
CS5jYWxsYmFjayA9IHNvZl9zZHdfcXVpcmtfY2IsDQo+ICsJCS5tYXRjaGVzID0gew0KPiArCQkJ
RE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiRGVsbCBJbmMiKSwNCj4gKwkJCURNSV9FWEFDVF9N
QVRDSChETUlfUFJPRFVDVF9TS1UsICIwQ0YzIikNCj4gKwkJfSwNCj4gKwkJLmRyaXZlcl9kYXRh
ID0gKHZvaWQgKikoU09GX0NPREVDX1NQS1IpLA0KPiArCX0sDQo+ICsJew0KPiArCQkuY2FsbGJh
Y2sgPSBzb2Zfc2R3X3F1aXJrX2NiLA0KPiArCQkubWF0Y2hlcyA9IHsNCj4gKwkJCURNSV9NQVRD
SChETUlfU1lTX1ZFTkRPUiwgIkRlbGwgSW5jIiksDQo+ICsJCQlETUlfRVhBQ1RfTUFUQ0goRE1J
X1BST0RVQ1RfU0tVLCAiMENGNCIpDQo+ICsJCX0sDQo+ICsJCS5kcml2ZXJfZGF0YSA9ICh2b2lk
ICopKFNPRl9DT0RFQ19TUEtSKSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLmNhbGxiYWNrID0gc29m
X3Nkd19xdWlya19jYiwNCj4gKwkJLm1hdGNoZXMgPSB7DQo+ICsJCQlETUlfTUFUQ0goRE1JX1NZ
U19WRU5ET1IsICJEZWxsIEluYyIpLA0KPiArCQkJRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNU
X1NLVSwgIjBDRjUiKQ0KPiArCQl9LA0KPiArCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKShTT0Zf
Q09ERUNfU1BLUiksDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5jYWxsYmFjayA9IHNvZl9zZHdfcXVp
cmtfY2IsDQo+ICsJCS5tYXRjaGVzID0gew0KPiArCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9S
LCAiRGVsbCBJbmMiKSwNCj4gKwkJCURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9TS1UsICIw
Q0Y3IikNCj4gKwkJfSwNCj4gKwkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikoU09GX0NPREVDX1NQ
S1IpLA0KPiArCX0sDQo+ICAgDQo+ICAgCS8qIEx1bmFyTGFrZSBkZXZpY2VzICovDQo+ICAgCXsN
Cj4gQEAgLTUyMSw2ICs1ODUsMzAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lk
IHNvZl9zZHdfcXVpcmtfdGFibGVbXSA9IHsNCj4gICAJCX0sDQo+ICAgCQkuZHJpdmVyX2RhdGEg
PSAodm9pZCAqKShTT0ZfU0lERUNBUl9BTVBTKSwNCj4gICAJfSwNCj4gKwl7DQo+ICsJCS5jYWxs
YmFjayA9IHNvZl9zZHdfcXVpcmtfY2IsDQo+ICsJCS5tYXRjaGVzID0gew0KPiArCQkJRE1JX01B
VENIKERNSV9TWVNfVkVORE9SLCAiRGVsbCBJbmMiKSwNCj4gKwkJCURNSV9FWEFDVF9NQVRDSChE
TUlfUFJPRFVDVF9TS1UsICIwQ0RDIikNCj4gKwkJfSwNCj4gKwkJLmRyaXZlcl9kYXRhID0gKHZv
aWQgKikoU09GX0NPREVDX1NQS1IpLA0KPiArCX0sDQo+ICsJew0KPiArCQkuY2FsbGJhY2sgPSBz
b2Zfc2R3X3F1aXJrX2NiLA0KPiArCQkubWF0Y2hlcyA9IHsNCj4gKwkJCURNSV9NQVRDSChETUlf
U1lTX1ZFTkRPUiwgIkRlbGwgSW5jIiksDQo+ICsJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RV
Q1RfU0tVLCAiMENERCIpDQo+ICsJCX0sDQo+ICsJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopKFNP
Rl9DT0RFQ19TUEtSKSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLmNhbGxiYWNrID0gc29mX3Nkd19x
dWlya19jYiwNCj4gKwkJLm1hdGNoZXMgPSB7DQo+ICsJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5E
T1IsICJEZWxsIEluYyIpLA0KPiArCQkJRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1NLVSwg
IjBDRjgiKQ0KPiArCQl9LA0KPiArCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKShTT0ZfQ09ERUNf
U1BLUiksDQo+ICsJfSwNCj4gICAJe30NCj4gICB9Ow0KPiAgIA==
