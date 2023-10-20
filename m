Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AA7D15E5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 20:37:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D4C8844;
	Fri, 20 Oct 2023 20:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D4C8844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697827048;
	bh=kAwj03eIW4NeyxBjV0BPg3fNKr174tkL6kmEroxIfS4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WX0uYfL+basDtVfLcfMXHSg5OBcsYNdyzJHwba5XoPfTIwiI92ivHh54ktdcSXb/Z
	 4PQxF4yU+d/XNe5RgHxsP7pAbJJ1TDFFwof+2sbwzrnaPtXdC9o8PHdx4uQIARVpQH
	 cn7bJXdEUzxhcCC7wD/4tVDRrxTyQ94F1y5QcGZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69387F8027B; Fri, 20 Oct 2023 20:36:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFEE3F8024E;
	Fri, 20 Oct 2023 20:36:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5766DF8025F; Fri, 20 Oct 2023 20:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79D7CF800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 20:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D7CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=C96RS+R3
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-578b4981526so795319a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 11:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697826979; x=1698431779;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP/KnOEQ5eK8/wdwGuqf+tjQMi4EZRWp4xbCwiXCzqI=;
        b=C96RS+R36sZ4jPKsz6aBSy7e1o3TCi3+gzBIlyFSnrk6x7xa1euBnCS0/Q+UyY8/65
         mhAD5hwoA3UzNUTrupZBj+N7tgNgvrt2c8sTTjkdtFsPIu6sDFdv/oq4HDT5AaFQTjQ3
         AnOhKQJJ1yShIh9OhYSexO24UhqlVCT9y7TquZ88qY6pkX9brRc/97nGfvyWqAlWDqrE
         fNgwAGT9htyhwMGyzruQRI1GU++ed+rcqJRD6jO4hVGgyogLqQa3MBgNiNaqvs8SyAuc
         C771OZzVIctiCgnnezfQ6IEs6ouvb238kjo7muJLEwNXhVTNYhiW2nk9ZwZMiQabSoBq
         ZswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697826979; x=1698431779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZP/KnOEQ5eK8/wdwGuqf+tjQMi4EZRWp4xbCwiXCzqI=;
        b=utbHeU3TD3Y5tHQN9PlFyXx7MESIs+GeCDx9SGeIa3dqLAZI9va/vkJCbRxGfdwK1G
         AcCOd/0eHUor8VzMS/4qbwyU+78qM+W9VNHvqkWUNJj0PLwwBtNGv8WZCA0OPTXDkzRt
         G6riFcTxOyP+Kn6/s/i1/JJdE/c42vg37b0E2pssX2F+bsCWVQWsB53JTlNr0udjh5nN
         5vV5yVGH1f8Oz6DO9LdCOETaC2V37XalBx68q/Sn13luu815mr2XAENITLvSs3N6qmEw
         owU9PpNfWRWBRjJevgbpKvGwppxH7PNu7iBsni90q8mz4LxqeM/+iQ31ogKAbsLgtU1p
         ilBQ==
X-Gm-Message-State: AOJu0YwiiSWgNAg+i1Cxk++WGvSbfZd7VwctxRgS+tcOR0IHNrrLOMh3
	Weo9elfwyN1GmJ5zophuAEqqlXxs0ee+LjQxoEnimA==
X-Google-Smtp-Source: 
 AGHT+IF59U/A+gZb+wNF6j1ie7GMT2TeUaYQGRGt8nEBaqANNawl+QvrwXORKYlLev+NTQa87GbA17m9EEvHm16i+tU=
X-Received: by 2002:a05:6a20:914b:b0:17b:129b:1813 with SMTP id
 x11-20020a056a20914b00b0017b129b1813mr3218594pzc.1.1697826978877; Fri, 20 Oct
 2023 11:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231018235944.1860717-1-markhas@chromium.org>
 <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
 <5bc82aca-04f2-463b-ba52-34bcae6724d5@linux.intel.com>
 <CANg-bXCaUOxSTfR1oXKrdnDozA9Hn-NL7mqg+zvLASLQyouChA@mail.gmail.com>
 <80f8a742-4a60-4c75-9093-dcd63de70b66@linux.intel.com>
In-Reply-To: <80f8a742-4a60-4c75-9093-dcd63de70b66@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 20 Oct 2023 11:36:06 -0700
Message-ID: 
 <CAOReqxguGKi=kSnPAqBReAdVss8xOG+OZ5YTCf2y8uQ_Y6kbGA@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Hasemeyer <markhas@chromium.org>,
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brady Norander <bradynorander@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>
Message-ID-Hash: EPU6LG2VI6DPX46ALEADFATLQQW7IKBW
X-Message-ID-Hash: EPU6LG2VI6DPX46ALEADFATLQQW7IKBW
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPU6LG2VI6DPX46ALEADFATLQQW7IKBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMTA6MDDigK9BTSBQaWVycmUtTG91aXMgQm9zc2FydCA8
DQpwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQo+DQo+DQo+
IE9uIDEwLzIwLzIzIDEwOjM2LCBNYXJrIEhhc2VtZXllciB3cm90ZToNCj4gPj4gRldJVyB3ZSB1
c2UgdGhpcyBvdGhlciBxdWlyazoNCj4gPj4gRE1JX01BVENIKERNSV9QUk9EVUNUX0ZBTUlMWSwg
Ikdvb2dsZSIpLA0KPiA+DQo+ID4gVW5mb3J0dW5hdGVseSBETUlfUFJPRFVDVF9GQU1JTFkgaXMg
ZW1wdHkgb24gdGhlc2UgcGFydGljdWxhciBkZXZpY2VzLg0KPiA+IFRoZSBjb3JlYm9vdCB2ZXJz
aW9uIGZpZWxkIGlzIHRoZSBvbmx5IGVudHJ5IHRoYXQgaGFzICJHb29nbGUiIGluIGl0Lg0KPg0K
PiB3ZWxsIHRoZW4geW91IGhhdmUgYWRkaXRpb25hbCBpc3N1ZXMgd2l0aCB0aGUgRE1JIHF1aXJr
IGZvciB0aGUgZmlybXdhcmUNCj4gc2VsZWN0aW9uIGluIHNvdW5kL3NvYy9zb2Yvc29mLXBjaS1k
ZXYuYywNCj4NCj4gICAgICAgew0KPiAgICAgICAgICAgICAgICAgLmlkZW50ID0gIkdvb2dsZSBD
aHJvbWVib29rcyIsDQo+ICAgICAgICAgICAgICAgICAuY2FsbGJhY2sgPSBjaHJvbWVib29rX3Vz
ZV9jb21tdW5pdHlfa2V5LA0KPiAgICAgICAgICAgICAgICAgLm1hdGNoZXMgPSB7DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIERNSV9NQVRDSChETUlfUFJPRFVDVF9GQU1JTFksICJHb29nbGUi
KSwNCj4gICAgICAgICAgICAgICAgIH0NCj4gICAgICAgICB9LA0KPg0KPiB3aGljaCBtZWFucyB5
b3UgbmVlZCBhZGRpdGlvbmFsIGtlcm5lbCBwYXJhbWV0ZXJzIHRvIHByb3ZpZGUgdGhlDQo+IGxv
Y2F0aW9uIG9mIHRoZSBmaXJtd2FyZS4uLi4NCj4NCj4gPj4gSG93IG1hbnkgZW5naW5lZXJzIGRv
ZXMgaXQgdGFrZSB0byBpZGVudGlmeSBhIENocm9tZWJvb2ssIGVoPw0KPiA+DQo+ID4gSGEhIFRo
ZXJlIGhhcyBiZWVuIHNvbWUgZGlzY3Vzc2lvbiBhYm91dCB0aGlzOiB0byBjb21lIHVwIHdpdGgg
YQ0KPiA+IGNhbm9uaWNhbCB3YXkgZm9yIENocm9tZWJvb2sgaWRlbnRpZmljYXRpb24gdGhyb3Vn
aG91dCB0aGUga2VybmVsLiBCdXQNCj4gPiBub3RoaW5nIGhhcyBiZWVuIHNldHRsZWQgb24gQUZB
SUsuDQo+DQo+IFRoZXJlJ3MgYmVlbiBtdWx0aXBsZSByb3VuZHMgb2YgZGlzY3Vzc2lvbnMgd2l0
aCBDdXJ0aXMsIHdlIGludHJvZHVjZWQNCj4gRE1JX09FTV9TVFJJTkcgYnV0IGl0J3Mgc3RpbGwg
bm90IGdvb2QgZW5vdWdoLCBhbmQgbm93IHRoZSBwcmV2aW91cw0KPiBjb252ZW50aW9ucyBhcmUg
bm90IGJlaW5nIGZvbGxvd2VkIG9uIHdoYXQgaXMgYSByZWxhdGl2ZWx5IG9sZCBwbGF0Zm9ybQ0K
PiBhbHJlYWR5Li4uDQo+DQoNClllYSBpdCBsb29rcyBsaWtlIEpTTCBtaXNzZWQgdGhlIHByb2R1
Y3QgZmFtaWx5IGZpZWxkLiBJdCdzIGxpa2UgcGxheWluZw0Kd2hhY2stYS1tb2xlLiBJZiB0aGF0
IHRhYmxlIGdldHMgbXVjaCBsYXJnZXIgd2UgbWlnaHQgaGF2ZSB0byBicmVhayBpdCBpbnRvDQph
IHBlciBwbGF0Zm9ybSBxdWlyayB0YWJsZS4uLg0K
