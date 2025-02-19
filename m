Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0AA3CBE1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2025 22:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E11146050E;
	Wed, 19 Feb 2025 22:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E11146050E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740002276;
	bh=pzahod2DYLW+1Xi9Qy2yohI9tLJ2DcLY31gvwLDj2xk=;
	h=Date:Subject:References:To:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nDEedhOpgFwZnbTsv3nEkO/DcDKu/Eb7/gOw4ej08rRYn9pQqYvUJOq1+PHtqQUA9
	 6Kmidy3Q7QybkEmdRyWgercp6KCxHidkhHppLNGnm+EYi3knsjHIVrRigH0Ix6mroO
	 x4yulyon/vKL7lt0b9AgyqvkqzSwynoeDkO5sxY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D58F805B6; Wed, 19 Feb 2025 22:57:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2124FF805BD;
	Wed, 19 Feb 2025 22:57:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B897DF8013D; Wed, 19 Feb 2025 22:57:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D275BF800EE
	for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2025 22:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D275BF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=d-systems.ee header.i=@d-systems.ee header.a=rsa-sha256
 header.s=mail header.b=wHP/mNcW;
	dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee
 header.a=rsa-sha256 header.s=mail header.b=wHP/mNcW
Received: from mail.d-sys.org (localhost [127.0.0.1])
	by mail.d-sys.org (Postfix) with ESMTP id 2FE0E6088C;
	Wed, 19 Feb 2025 23:57:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740002236; bh=pzahod2DYLW+1Xi9Qy2yohI9tLJ2DcLY31gvwLDj2xk=;
	h=Date:Subject:References:To:From:In-Reply-To;
	b=wHP/mNcW15DoYhMQ6kZ+z0m6D8Q0LDAIiiH1nzpMYv4xRyiUz+hrJjoDz9KWU3ccd
	 GCqRbShvY2YPF/mcVyR9RRuZ/jV5wCadalT6ok8aNvMVWluwPnYqMyipu2OI7lFYeH
	 M27trZSbCMDvLBHgADqYbYRSLa4YQdsAqYFaJ6+YNR7MPTrhajXQrgWyaBJZcPeyFY
	 6dlPMK0mCkm0ggrMfc9/uHfLXVnOwbBTq1Uz1b7XBYRrl3+XgQROvrnJGGmQdVSdWa
	 q+4nOuM0MwBcdwv6Utq7UehpFwqcYgoAyfZx622r7bPY1RELANuOGv2SJtZjs42lRt
	 mfMnhm1sclYnw==
Received: from [10.255.10.44] (GW.ds.local [10.255.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by mail.d-sys.org (Postfix) with ESMTPSA id 1F856605F6;
	Wed, 19 Feb 2025 23:57:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740002236; bh=pzahod2DYLW+1Xi9Qy2yohI9tLJ2DcLY31gvwLDj2xk=;
	h=Date:Subject:References:To:From:In-Reply-To;
	b=wHP/mNcW15DoYhMQ6kZ+z0m6D8Q0LDAIiiH1nzpMYv4xRyiUz+hrJjoDz9KWU3ccd
	 GCqRbShvY2YPF/mcVyR9RRuZ/jV5wCadalT6ok8aNvMVWluwPnYqMyipu2OI7lFYeH
	 M27trZSbCMDvLBHgADqYbYRSLa4YQdsAqYFaJ6+YNR7MPTrhajXQrgWyaBJZcPeyFY
	 6dlPMK0mCkm0ggrMfc9/uHfLXVnOwbBTq1Uz1b7XBYRrl3+XgQROvrnJGGmQdVSdWa
	 q+4nOuM0MwBcdwv6Utq7UehpFwqcYgoAyfZx622r7bPY1RELANuOGv2SJtZjs42lRt
	 mfMnhm1sclYnw==
Content-Type: multipart/mixed; boundary="------------YI2dlklpMzL3Fz0248q5Gg3O"
Message-ID: <a368345f-7474-4ee9-b02e-82789a4a981b@d-systems.ee>
Date: Wed, 19 Feb 2025 23:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: ALSA: usb-audio: Add Pioneer DJ DJM-900NXS2 support
Content-Language: ru
References: <a93cb55a-66f6-38f8-fab6-40f1bf6a5ab9@d-systems.ee>
To: Takashi Iwai <tiwai@suse.de>, Alexander Tsoy <alexander@tsoy.me>,
 alsa-devel@alsa-project.org
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
In-Reply-To: <a93cb55a-66f6-38f8-fab6-40f1bf6a5ab9@d-systems.ee>
X-Forwarded-Message-Id: <a93cb55a-66f6-38f8-fab6-40f1bf6a5ab9@d-systems.ee>
X-AV-Checked: ClamAV using ClamSMTP
Message-ID-Hash: WSUO77RT6TNRRSB3LAOVI55D47ME6DS7
X-Message-ID-Hash: WSUO77RT6TNRRSB3LAOVI55D47ME6DS7
X-MailFrom: dmitry@d-systems.ee
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSUO77RT6TNRRSB3LAOVI55D47ME6DS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-part message in MIME format.
--------------YI2dlklpMzL3Fz0248q5Gg3O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Pioneer DJ DJM-900NXS2 is a widely used DJ mixer with 2 audio USB 
interfaces. Both have a MIDI controller, 10 playback and 12 capture 
channels. I've submitted Pioneer DJM-900NXS2 support patches back in 
2020, but someone has removed set_format_quirk function for DJM-900NXS2 
model. The playback and capture do not work, quirks.c needs to be 
patched. The patch is attached, please add.

Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
-- 

Kind regards,
Dmitry Panchenko
--------------YI2dlklpMzL3Fz0248q5Gg3O
Content-Type: text/x-patch; charset=UTF-8; name="quirks.c.patch"
Content-Disposition: attachment; filename="quirks.c.patch"
Content-Transfer-Encoding: base64

KioqIGxpbnV4LTUuMTUuNTAvc291bmQvdXNiL3F1aXJrcy5jCTIwMjItMDYtMjUgMTY6MTg6
NDAuMDAwMDAwMDAwICswMzAwCi0tLSBsaW51eC01LjE1LjUwLXBhdGNoZWQvc291bmQvdXNi
L3F1aXJrcy5jCTIwMjItMTEtMDIgMjI6MjM6MDUuNTc5OTA2OTU5ICswMjAwCioqKioqKioq
KioqKioqKiB2b2lkIHNuZF91c2Jfc2V0X2Zvcm1hdF9xdWlyayhzdHJ1Y3Qgc25kCioqKiAx
NDgzLDE0ODQgKioqKgotLS0gMTQ4MywxNDg3IC0tLS0KICAJCWJyZWFrOworIAljYXNlIFVT
Ql9JRCgweDJiNzMsIDB4MDAwYSk6IC8qIFBpb25lZXIgREpNLTkwME5YUzIgKi8KKyAJCXBp
b25lZXJfZGptX3NldF9mb3JtYXRfcXVpcmsoc3VicywgMHgwMDgyKTsKKyAJCWJyZWFrOwog
IAljYXNlIFVTQl9JRCgweDJiNzMsIDB4MDAxMyk6IC8qIFBpb25lZXIgREpNLTQ1MCAqLwo=


--------------YI2dlklpMzL3Fz0248q5Gg3O--
