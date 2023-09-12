Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BD79CCFC
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:05:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 087E3E74;
	Tue, 12 Sep 2023 12:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 087E3E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694513110;
	bh=OdceQUJ81oDAiQBU1P3opnMSUs9C8OpfoE+e0R+ePsc=;
	h=Date:From:To:Cc:Subject:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UqwSLBE2v0PJKiSytQ4iRIRi3IIBqfTzbYMCljqHB0pHu/vuqZCj/X7Ov68EAudWL
	 6iWmu1L3ZTk0vNMr+qUs3HLVXaC+Wi8cfgfQ9SFiShD7E12dxyAbaMDVcibcWjDdwa
	 EgNox8fvb0LFx8QFx+yXhP08EIvCzWUjv8PSjyGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32B8EF805B6; Tue, 12 Sep 2023 12:02:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05762F805B5;
	Tue, 12 Sep 2023 12:02:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE89CF80425; Tue, 12 Sep 2023 03:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=HTML_MESSAGE,
	MIME_QP_LONG_LINE,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp2.hiworks.co.kr (smtp2.hiworks.co.kr [121.254.168.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2951F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 03:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2951F8007C
Received: (qmail 76758 invoked from network); 12 Sep 2023 10:23:08 +0900
Received: from unknown (HELO localhost.localdomain) (211.43.203.135)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	12 Sep 2023 10:23:08 +0900
Received: from localhost.localdomain (hiworks-web135 [127.0.0.1])
	by localhost.localdomain (8.15.2/8.13.8) with ESMTP id 38C1N8Qf137039;
	Tue, 12 Sep 2023 10:23:08 +0900
Received: (from nobody@localhost)
	by localhost.localdomain (8.15.2/8.13.8/Submit) id 38C1N8Rl137026;
	Tue, 12 Sep 2023 10:23:08 +0900
X-Authentication-Warning: localhost.localdomain: nobody set sender to
 mwkim@gaonchips.com using -f
Date: Tue, 12 Sep 2023 10:23:07 +0900
X-Authinfo: HIWORKS WEB authenticated <mwkim@gaonchips.com>
From: =?utf-8?B?6rmA66qF7Jqx?= <mwkim@gaonchips.com>
To: =?utf-8?B?QmFnYXMgU2FuamF5YQ==?= <bagasdotme@gmail.com>,
        alsa-devel@alsa-project.org
Cc: =?utf-8?B?TGlhbSBHaXJkd29vZA==?= <lgirdwood@gmail.com>,
        =?utf-8?B?TWFyayBCcm93bg==?= <broonie@kernel.org>,
        =?utf-8?B?SmFyb3NsYXYgS3lzZWxh?= <perex@perex.cz>,
        =?utf-8?B?VGFrYXNoaSBJd2Fp?= <tiwai@suse.com>,
        =?utf-8?B?TWF4aW0gS29jaGV0a292?= <fido_max@inbox.ru>,
        =?utf-8?B?S3VuaW5vcmkgTW9yaW1vdG8=?=
 <kuninori.morimoto.gx@renesas.com>,
        =?utf-8?B?WGluZ3l1IFd1?= <xingyu.wu@starfivetech.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org, mwkim@gaonchips.com
Subject: 
 =?utf-8?B?UkU6IFJlOiBbUEFUQ0hdIEFTb0M6IGR3YzogZml4IHR5cG8gaW4gY29tbWVudA==?=
X-Sender: mwkim@gaonchips.com
X-Mailer: HiworksMail
X-Priority: 3 (Normal)
Message-ID: <gab64ffbd7bdbafc@gaonchips.com>
Mime-Version: 1.0
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FLFEXJEQXOLD3BMBS7UG7RD34Y4AF26S
X-Message-ID-Hash: FLFEXJEQXOLD3BMBS7UG7RD34Y4AF26S
X-Mailman-Approved-At: Tue, 12 Sep 2023 10:02:27 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=utf-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: =?utf-8?B?Iuq5gOuqheyasSI=?= <mwkim@gaonchips.com>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLFEXJEQXOLD3BMBS7UG7RD34Y4AF26S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SVNSX1JYRk8gbWVhbnMgXCJTdGF0dXMgb2YgRGF0YSBPdmVycnVuIGludGVycnVwdCBmb3IgdGhl
IFJYIGNoYW5uZWxcIgphY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldFNvLCB0aGUgY29tbWVudCBz
aG91bGQgYmUgUlgsIG5vdApUWFRoYW5rc015dW5ndWstLS0tLS0tLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0tLS0tLS0tU3ViamVjdCA6IFJlOiBbUEFUQ0hdCkFTb0M6IGR3YzogZml4IHR5cG8g
aW4gY29tbWVudERhdGUgOiAyMDIzLTA5LTExIDIxOjQ2OjA1RnJvbSA6IEJhZ2FzIFNhbmpheWEK
Jmx0O2JhZ2FzZG90bWVAZ21haWxjb20mZ3Q7VG8gOiBNeXVuZ3VrIEtpbSAmbHQ7bXdraW1AZ2Fv
bmNoaXBzY29tJmd0OywKYWxzYS1kZXZlbEBhbHNhLXByb2plY3RvcmdDYyA6IExpYW0gR2lyZHdv
b2QgJmx0O2xnaXJkd29vZEBnbWFpbGNvbSZndDssCk1hcmsgQnJvd24gJmx0O2Jyb29uaWVAa2Vy
bmVsb3JnJmd0OywgSmFyb3NsYXYgS3lzZWxhICZsdDtwZXJleEBwZXJleGN6Jmd0OywKVGFrYXNo
aSBJd2FpICZsdDt0aXdhaUBzdXNlY29tJmd0OywgTWF4aW0gS29jaGV0a292CiZsdDtmaWRvX21h
eEBpbmJveHJ1Jmd0OywgS3VuaW5vcmkgTW9yaW1vdG8KJmx0O2t1bmlub3JpbW9yaW1vdG9neEBy
ZW5lc2FzY29tJmd0OywgWGluZ3l1IFd1CiZsdDt4aW5neXV3dUBzdGFyZml2ZXRlY2hjb20mZ3Q7
LCBVd2UgS2xlaW5lLUvDtm5pZwombHQ7dWtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXhkZSZndDss
IGxpbnV4LWtlcm5lbEB2Z2Vya2VybmVsb3JnT24gTW9uLCBTZXAKMTEsIDIwMjMgYXQgMDM6NDY6
NDZQTSArMDkwMCwgTXl1bmd1ayBLaW0gd3JvdGU6Jmd0OyBUaGlzIGZpeGVzIHR5cG8gaW4KY29t
bWVudE9uIHdoYXQ/IENhbiB5b3UgZGVzY3JpYmUgdGhlIHR5cG9maXggaW4gbW9yZSBkZXRhaWw/
Jmd0OyZndDsKU2lnbmVkLW9mZi1ieTogTXl1bmd1ayBLaW0gJmx0O213a2ltQGdhb25jaGlwc2Nv
bSZndDsmZ3Q7IC0tLSZndDsKc291bmQvc29jL2R3Yy9kd2MtaTJzYyB8IDIgKy0mZ3Q7IDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMQpkZWxldGlvbigtKSZndDsmZ3Q7IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvZHdjL2R3Yy1pMnNjCmIvc291bmQvc29jL2R3Yy9kd2MtaTJzYyZndDsg
aW5kZXggNzFmZjg5NDAzNWE0NDVlNTVlNTUwOTI0IDEwMDY0NCZndDsgLS0tCmEvc291bmQvc29j
L2R3Yy9kd2MtaTJzYyZndDsgKysrIGIvc291bmQvc29jL2R3Yy9kd2MtaTJzYyZndDsgQEAgLTEz
OCw3CisxMzgsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaTJzX2lycV9oYW5kbGVyKGludCBpcnEs
IHZvaWQgKmRldl9pZCkmZ3Q7CmlycV92YWxpZCA9IHRydWU7Jmd0OyB9Jmd0OyZndDsgLSAvKiBF
cnJvciBIYW5kbGluZzogVFggKi8mZ3Q7ICsgLyogRXJyb3IKSGFuZGxpbmc6IFJYICovJmd0OyBp
ZiAoaXNyW2ldICZhbXA7IElTUl9SWEZPKSZndDsgewpkZXZfZXJyX3JhdGVsaW1pdGVkKGRldi0m
Z3Q7ZGV2LCBcIlJYIG92ZXJydW4gKGNoX2lkPSVkKVxcblwiLCBpKTsmZ3Q7CmlycV92YWxpZCA9
IHRydWU7T2gsIHlvdSBtZWFuIHRoZSBjb2RlIGZvbGxvd2luZyB0aGUgY29tbWVudCBjaGVja3Mg
Zm9yIFJYRk8Kb3ZlcnJ1bkNvbmZ1c2VkLS1BbiBvbGQgbWFuIGRvbGwganVzdCB3aGF0IEkgYWx3
YXlzIHdhbnRlZCEgLSBDbGFyYQo=
