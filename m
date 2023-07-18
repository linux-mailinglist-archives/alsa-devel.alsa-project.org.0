Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79017757BB3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93588DEC;
	Tue, 18 Jul 2023 14:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93588DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682940;
	bh=5dCL3lDSxIdcSu7OovkLTdDkIjmpDhADik8BCbJVh8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GckLGInO5+4CIpi+sSCjHfF1k4jF7gbMl4TnWaNl/7+gCilbMNAo6bLjluVTEtMH0
	 95wr13k3Zhv5wqwTE+v32DFk5h4U6d73g/XRFU63RHNaQIuf7QAwGfrL4ZZn1Wa9rr
	 qCdTRm0+FobC20HivobOfZlOJSQR/M66o/fZcOr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EAA6F80548; Tue, 18 Jul 2023 14:20:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7953EF8053B;
	Tue, 18 Jul 2023 14:20:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A06EAF8032D; Tue, 18 Jul 2023 13:59:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5928F80153;
	Tue, 18 Jul 2023 13:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5928F80153
Message-ID: <812760a8-11c4-83af-7071-c16bee3e6900@linux.intel.com>
Date: Tue, 18 Jul 2023 13:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [v2 PATCH 2/2] ALSA: hda/intel: Move snd_hdac_i915_init to before
 probe_work.
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-6-maarten.lankhorst@linux.intel.com>
 <87h6q1o82l.wl-tiwai@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87h6q1o82l.wl-tiwai@suse.de>
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DR3CY4ALLE4HXDKLOPPZQN27ISFADKOE
X-Message-ID-Hash: DR3CY4ALLE4HXDKLOPPZQN27ISFADKOE
X-Mailman-Approved-At: Tue, 18 Jul 2023 12:20:35 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DR3CY4ALLE4HXDKLOPPZQN27ISFADKOE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Tm93IHRoYXQgd2UgY2FuIHVzZSAtRVBST0JFX0RFRkVSLCBpdCdzIG5vIGxvbmdlciByZXF1aXJl
ZCB0byBzcGluIG9mZg0KdGhlIHNuZF9oZGFjX2k5MTVfaW5pdCBpbnRvIGEgd29ya3F1ZXVlLg0K
DQpVc2UgdGhlIC1FUFJPQkVfREVGRVIgbWVjaGFuaXNtIGluc3RlYWQsIHdoaWNoIG11c3QgYmUg
cmV0dXJuZWQgaW4gdGhlDQpwcm9iZSBmdW5jdGlvbi4NCg0KQ2hhbmdlcyBzaW5jZSB2MToNCi0g
VXNlIGRldl9lcnJfcHJvYmUoKQ0KLSBEb24ndCBtb3ZlIHByb2JlZF9kZXZzIGJpdG1hcCB1bm5l
Y2Vzc2FyaWx5LiAodGl3YWkpDQotIFVzZSBnb3RvIG91dF9henhfZnJlZSBhZnRlciBjbGVhbnVw
IG9mIGVycm9yIHBhdGguICh0aXdhaSkNCi0gTW92ZSBzbmRfaGRhY19pOTE1X2luaXQgc2xpZ2h0
bHkgdXB3YXJkLCB0byBlbnN1cmUNCiAgIGl0J3MgYWx3YXlzIGluaXRpYWxpc2VkIGJlZm9yZSB2
Z2Etc3dpdGNoZXJvbyBpcyBjYWxsZWQuDQoNClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hv
cnN0PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCi0tLQ0KICBzb3VuZC9wY2kv
aGRhL2hkYV9pbnRlbC5jIHwgNjAgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tDQogIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMgYi9zb3VuZC9wY2kvaGRh
L2hkYV9pbnRlbC5jDQppbmRleCAxOTZjYTc2YWM0M2FkLi41OTAzOWExZjAxMDM1IDEwMDY0NA0K
LS0tIGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYw0KKysrIGIvc291bmQvcGNpL2hkYS9oZGFf
aW50ZWwuYw0KQEAgLTIxNDcsNiArMjE0NywzNiBAQCBzdGF0aWMgaW50IGF6eF9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGNpLA0KICANCiAgCXBjaV9zZXRfZHJ2ZGF0YShwY2ksIGNhcmQpOw0KICAN
CisjaWZkZWYgQ09ORklHX1NORF9IREFfSTkxNQ0KKwkvKiBiaW5kIHdpdGggaTkxNSBpZiBuZWVk
ZWQgKi8NCisJaWYgKGNoaXAtPmRyaXZlcl9jYXBzICYgQVpYX0RDQVBTX0k5MTVfQ09NUE9ORU5U
KSB7DQorCQllcnIgPSBzbmRfaGRhY19pOTE1X2luaXQoYXp4X2J1cyhjaGlwKSwgZmFsc2UpOw0K
KwkJaWYgKGVyciA8IDApIHsNCisJCQkvKiBpZiB0aGUgY29udHJvbGxlciBpcyBib3VuZCBvbmx5
IHdpdGggSERNSS9EUA0KKwkJCSAqIChmb3IgSFNXIGFuZCBCRFcpLCB3ZSBuZWVkIHRvIGFib3J0
IHRoZSBwcm9iZTsNCisJCQkgKiBmb3Igb3RoZXIgY2hpcHMsIHN0aWxsIGNvbnRpbnVlIHByb2Jp
bmcgYXMgb3RoZXINCisJCQkgKiBjb2RlY3MgY2FuIGJlIG9uIHRoZSBzYW1lIGxpbmsuDQorCQkJ
ICovDQorCQkJaWYgKENPTlRST0xMRVJfSU5fR1BVKHBjaSkpIHsNCisJCQkJZGV2X2Vycl9wcm9i
ZShjYXJkLT5kZXYsIGVyciwNCisJCQkJCSAgICAgIkhTVy9CRFcgSEQtYXVkaW8gSERNSS9EUCBy
ZXF1aXJlcyBiaW5kaW5nIHdpdGggZ2Z4IGRyaXZlclxuIik7DQorDQorCQkJCWdvdG8gb3V0X2F6
eF9mcmVlOw0KKwkJCX0gZWxzZSB7DQorCQkJCS8qIGRvbid0IGJvdGhlciBhbnkgbG9uZ2VyICov
DQorCQkJCWNoaXAtPmRyaXZlcl9jYXBzICY9IH5BWlhfRENBUFNfSTkxNV9DT01QT05FTlQ7DQor
CQkJfQ0KKwkJfQ0KKw0KKwkJLyogSFNXL0JEVyBjb250cm9sbGVycyBuZWVkIHRoaXMgcG93ZXIg
Ki8NCisJCWlmIChDT05UUk9MTEVSX0lOX0dQVShwY2kpKQ0KKwkJCWhkYS0+bmVlZF9pOTE1X3Bv
d2VyID0gdHJ1ZTsNCisJfQ0KKyNlbHNlDQorCWlmIChDT05UUk9MTEVSX0lOX0dQVShwY2kpKQ0K
KwkJZGV2X2VycihjYXJkLT5kZXYsICJIYXN3ZWxsL0Jyb2Fkd2VsbCBIRE1JL0RQIG11c3QgYnVp
bGQgaW4gQ09ORklHX1NORF9IREFfSTkxNVxuIik7DQorI2VuZGlmDQorDQogIAllcnIgPSByZWdp
c3Rlcl92Z2Ffc3dpdGNoZXJvbyhjaGlwKTsNCiAgCWlmIChlcnIgPCAwKSB7DQogIAkJZGV2X2Vy
cihjYXJkLT5kZXYsICJFcnJvciByZWdpc3RlcmluZyB2Z2Ffc3dpdGNoZXJvbyBjbGllbnRcbiIp
Ow0KQEAgLTIxNzQsMTEgKzIyMDUsNiBAQCBzdGF0aWMgaW50IGF6eF9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGNpLA0KICAJfQ0KICAjZW5kaWYgLyogQ09ORklHX1NORF9IREFfUEFUQ0hfTE9BREVS
ICovDQogIA0KLSNpZm5kZWYgQ09ORklHX1NORF9IREFfSTkxNQ0KLQlpZiAoQ09OVFJPTExFUl9J
Tl9HUFUocGNpKSkNCi0JCWRldl9lcnIoY2FyZC0+ZGV2LCAiSGFzd2VsbC9Ccm9hZHdlbGwgSERN
SS9EUCBtdXN0IGJ1aWxkIGluIENPTkZJR19TTkRfSERBX0k5MTVcbiIpOw0KLSNlbmRpZg0KLQ0K
ICAJaWYgKHNjaGVkdWxlX3Byb2JlKQ0KICAJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmaGRhLT5w
cm9iZV93b3JrLCAwKTsNCiAgDQpAQCAtMjI3NywzMCArMjMwMyw2IEBAIHN0YXRpYyBpbnQgYXp4
X3Byb2JlX2NvbnRpbnVlKHN0cnVjdCBhenggKmNoaXApDQogIAl0b19oZGFfYnVzKGJ1cyktPmJ1
c19wcm9iaW5nID0gMTsNCiAgCWhkYS0+cHJvYmVfY29udGludWVkID0gMTsNCiAgDQotCS8qIGJp
bmQgd2l0aCBpOTE1IGlmIG5lZWRlZCAqLw0KLQlpZiAoY2hpcC0+ZHJpdmVyX2NhcHMgJiBBWlhf
RENBUFNfSTkxNV9DT01QT05FTlQpIHsNCi0JCWVyciA9IHNuZF9oZGFjX2k5MTVfaW5pdChidXMs
IHRydWUpOw0KLQkJaWYgKGVyciA8IDApIHsNCi0JCQkvKiBpZiB0aGUgY29udHJvbGxlciBpcyBi
b3VuZCBvbmx5IHdpdGggSERNSS9EUA0KLQkJCSAqIChmb3IgSFNXIGFuZCBCRFcpLCB3ZSBuZWVk
IHRvIGFib3J0IHRoZSBwcm9iZTsNCi0JCQkgKiBmb3Igb3RoZXIgY2hpcHMsIHN0aWxsIGNvbnRp
bnVlIHByb2JpbmcgYXMgb3RoZXINCi0JCQkgKiBjb2RlY3MgY2FuIGJlIG9uIHRoZSBzYW1lIGxp
bmsuDQotCQkJICovDQotCQkJaWYgKENPTlRST0xMRVJfSU5fR1BVKHBjaSkpIHsNCi0JCQkJZGV2
X2VycihjaGlwLT5jYXJkLT5kZXYsDQotCQkJCQkiSFNXL0JEVyBIRC1hdWRpbyBIRE1JL0RQIHJl
cXVpcmVzIGJpbmRpbmcgd2l0aCBnZnggZHJpdmVyXG4iKTsNCi0JCQkJZ290byBvdXRfZnJlZTsN
Ci0JCQl9IGVsc2Ugew0KLQkJCQkvKiBkb24ndCBib3RoZXIgYW55IGxvbmdlciAqLw0KLQkJCQlj
aGlwLT5kcml2ZXJfY2FwcyAmPSB+QVpYX0RDQVBTX0k5MTVfQ09NUE9ORU5UOw0KLQkJCX0NCi0J
CX0NCi0NCi0JCS8qIEhTVy9CRFcgY29udHJvbGxlcnMgbmVlZCB0aGlzIHBvd2VyICovDQotCQlp
ZiAoQ09OVFJPTExFUl9JTl9HUFUocGNpKSkNCi0JCQloZGEtPm5lZWRfaTkxNV9wb3dlciA9IHRy
dWU7DQotCX0NCi0NCiAgCS8qIFJlcXVlc3QgZGlzcGxheSBwb3dlciB3ZWxsIGZvciB0aGUgSERB
IGNvbnRyb2xsZXIgb3IgY29kZWMuIEZvcg0KICAJICogSGFzd2VsbC9Ccm9hZHdlbGwsIGJvdGgg
dGhlIGRpc3BsYXkgSERBIGNvbnRyb2xsZXIgYW5kIGNvZGVjIG5lZWQNCiAgCSAqIHRoaXMgcG93
ZXIuIEZvciBvdGhlciBwbGF0Zm9ybXMsIGxpa2UgQmF5dHJhaWwvQnJhc3dlbGwsIG9ubHkgdGhl
DQotLSANCjIuMzkuMg0KDQo=
