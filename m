Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F11157EB4A9
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 17:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1981F827;
	Tue, 14 Nov 2023 17:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1981F827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699978925;
	bh=gq++T2N6yczFeDicNadp8efFkQBE6CIDKf2+1VFjvmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ic8JUzsdrWMihfWDLtZ624ApSThlC92hFGnvZJODBpVI9mQuTuyyFQ6Ue4Nv+npGm
	 eWVRvFhO6VCfo3r9qoStHvYRjtUD/r1TxCCRUJ3MeFKvmoOEV9faAXi43aZSBCW7PL
	 ckfJhSsIA87FDa4WjYm5bANQ30IxMFp/4gzlEja8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89381F8055C; Tue, 14 Nov 2023 17:20:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBD1F8055C;
	Tue, 14 Nov 2023 17:20:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BDF4F801D5; Tue, 14 Nov 2023 15:39:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF239F80166
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 15:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF239F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cxJdP7Du
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699972784; x=1731508784;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=RNu88Qa8kRK+fGGgkqNdrWpncasm0z6GqSV1j3RyLMc=;
  b=cxJdP7Duy+i3Vkl+tEooaQ1NgWNzGF29wmd1gOLwSPxQqD9a2i/ov7jm
   bnWGg+07q3ufDFCFIZkQdhL9sauuDgldc+tdDQZXhV7KzucURYjyZkiYI
   nczCRUS4cX/zo974WubVljAPhlYdHMtv7tzsgfgpIf1IH3UVY8FYwhUgb
   OzvctE6iOj9zVi0gZe+Ons7sTyQN+i1KVguvZsg3lCu14meZBjydw5Fk7
   K4EMPlecN9JG8iLF0plrGHsc4DoUJ/ukwDjHurGOEEpTPUyQ40/fN16yZ
   QRfPUZPeoSChkZHHrwPzzS8bhnnq02HPEVxJcCEbk+pQc9SytNLBOUVic
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390459804"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208,217";a="390459804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 06:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208,217";a="6045497"
Received: from pchochol-mobl.ger.corp.intel.com (HELO [10.251.218.4])
 ([10.251.218.4])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 06:39:18 -0800
Message-ID: <f72ce7ff-19a4-4a12-9ede-615a964e7228@linux.intel.com>
Date: Tue, 14 Nov 2023 15:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alsa-devel@alsa-project.org,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com> <87bkbwsebl.fsf@intel.com>
 <ZVN4rQjLxROOjTE-@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZVN4rQjLxROOjTE-@intel.com>
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VVVJQ2BAQX3RX5ITAZVMS75U4O6CCAUR
X-Message-ID-Hash: VVVJQ2BAQX3RX5ITAZVMS75U4O6CCAUR
X-Mailman-Approved-At: Tue, 14 Nov 2023 16:20:36 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVVJQ2BAQX3RX5ITAZVMS75U4O6CCAUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGV5LA0KDQpEZW4gMjAyMy0xMS0xNCBrbC4gMTQ6MzksIHNrcmV2IFZpbGxlIFN5cmrDpGzDpDoN
Cj4gT24gVHVlLCBOb3YgMTQsIDIwMjMgYXQgMDI6MzU6MTBQTSArMDIwMCwgSmFuaSBOaWt1bGEg
d3JvdGU6DQo+PiBPbiBUdWUsIDE0IE5vdiAyMDIzLCBWaWxsZSBTeXJqw6Rsw6Q8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+ICB3cm90ZToNCj4+PiBPbiBNb24sIE9jdCAwMiwgMjAyMyBh
dCAwOTozODo0NFBNICswMjAwLG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbSAgd3Jv
dGU6DQo+Pj4+IEZyb206IE1hYXJ0ZW4gTGFua2hvcnN0PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4+Pj4NCj4+Pj4gTm93IHRoYXQgd2UgY2FuIHVzZSAtRVBST0JFX0RFRkVS
LCBpdCdzIG5vIGxvbmdlciByZXF1aXJlZCB0byBzcGluIG9mZg0KPj4+PiB0aGUgc25kX2hkYWNf
aTkxNV9pbml0IGludG8gYSB3b3JrcXVldWUuDQo+Pj4+DQo+Pj4+IFVzZSB0aGUgLUVQUk9CRV9E
RUZFUiBtZWNoYW5pc20gaW5zdGVhZCwgd2hpY2ggbXVzdCBiZSByZXR1cm5lZCBpbiB0aGUNCj4+
Pj4gcHJvYmUgZnVuY3Rpb24uDQo+Pj4gVGhpcyBjb21wbGV0ZWx5IGJyb2tlIGk5MTUgYXVkaW8h
DQo+Pj4NCj4+PiBJIGFsc28gY2FuJ3Qgc2VlIGFueSB0cmFjZSBvZiB0aGlzIHN0dWZmIGV2ZXIg
YmVpbmcgcG9zdGVkIHRvDQo+Pj4gaW50ZWwtZ2Z4IHNvIGl0IG5ldmVyIHdlbnQgdGhyb3VnaCB0
aGUgQ0kuDQo+Pj4NCj4+PiBQbGVhc2UgZml4IG9yIHJldmVydCBBU0FQLg0KPj4gQ2M6IEphbmks
IFN1cmVzaA0KPj4NCj4+IFZpbGxlLCBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBnaXRsYWIgc28gd2Ug
Y2FuIHRyYWNrIHRoaXMsIHRoYW5rcy4NCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pbnRlbC8tL2lzc3Vlcy85NjcxDQoNCkxvb2tzIGxpa2UgYSBzaW1wbGUgcGF0Y2ggc2hv
dWxkIGJlIGVub3VnaCwgY2FuIHlvdSB0ZXN0IGJlbG93Pw0KDQotLS0tDQoNCmRpZmYgLS1naXQg
YS9zb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYw0K
aW5kZXggMDU4ZjZlNjQ5MWY5YS4uOTQ2YWFhNDg3ZjIwMCAxMDA2NDQNCi0tLSBhL3NvdW5kL3Bj
aS9oZGEvaGRhX2ludGVsLmMNCisrKyBiL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMNCkBAIC0y
MTQ1LDcgKzIxNDUsOCBAQCBzdGF0aWMgaW50IGF6eF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNp
LA0KICAJCQkgKiBmb3Igb3RoZXIgY2hpcHMsIHN0aWxsIGNvbnRpbnVlIHByb2JpbmcgYXMgb3Ro
ZXINCiAgCQkJICogY29kZWNzIGNhbiBiZSBvbiB0aGUgc2FtZSBsaW5rLg0KICAJCQkgKi8NCi0J
CQlpZiAoSERBX0NPTlRST0xMRVJfSU5fR1BVKHBjaSkpIHsNCisJCQlpZiAoSERBX0NPTlRST0xM
RVJfSU5fR1BVKHBjaSkgfHwNCisJCQkgICAgZXJyID09IC1FUFJPQkVfREVGRVIpIHsNCiAgCQkJ
CWdvdG8gb3V0X2ZyZWU7DQogIAkJCX0gZWxzZSB7DQogIAkJCQkvKiBkb24ndCBib3RoZXIgYW55
IGxvbmdlciAqLw0K
