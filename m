Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7724C1F8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 17:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C3F1685;
	Thu, 20 Aug 2020 17:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C3F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597936682;
	bh=lzG7sQDd8QT6ZCz7MDdBPBzOvlZ2Vgh3p2f83JomXHA=;
	h=Date:To:From:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Zpe+RLQFAm/8ZoOaO5k+peKQhj5siv5+biub5GHmAYi7hQe0/K4LsnmMC3jeG9V10
	 Odymt+W3lieV05N1/baAzmL3ei2vpyf0vLtLdYqHPF6SDJ2O+0q/VFtzTOTHggvUGs
	 R1rlT0KRGji7nfWbm4tcs4p4LXosTiJkkN0pwOYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24237F800C0;
	Thu, 20 Aug 2020 17:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AB90F80228; Thu, 20 Aug 2020 17:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA78F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 17:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA78F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="deGfZPiE"
Date: Thu, 20 Aug 2020 15:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1597936565;
 bh=BumdmsdgwvzxLXtgNWAyOerRxXPxyHUS+0BWor0pGbg=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=deGfZPiEMQ7EV4dO74HhEFhCmeXYtaMNlLVLH9SiLduEh1jcJdRgMBRGUNzynAkVN
 waCdCMhayRBIIPG34dYuD5ntZV6D+bRpEU4c0lob8o4iSMUBLIi7WBbbzrX6jZkbR3
 RT31cPSb8q8skSaYUO4Nb6UI5qfNmvJssvsnrMw0=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Krabador <krabador@protonmail.com>
Subject: Re: JamVOX usb soundcard works only after windows reboot
Message-ID: <EGiN6Xg8K2MWsO2-_ruIXb001U-qTatQ5PaaYjaHAx6_zhWKvEOE7bLE0XhyYXwhngBX3F-PzLozYFYt_UUAb7P_0lodyNTo4yfG_eIuxNc=@protonmail.com>
In-Reply-To: <0ADdOsEQXMKYMVgDetd2Jh24_GZwyWhL4pTKPva9kGKj6RcAbF14tuapZzJEJoYiuPuTRwzXYGFhyl6nOnUfzLRXAIFQfegQpOP3qxv2twk=@protonmail.com>
References: <0ADdOsEQXMKYMVgDetd2Jh24_GZwyWhL4pTKPva9kGKj6RcAbF14tuapZzJEJoYiuPuTRwzXYGFhyl6nOnUfzLRXAIFQfegQpOP3qxv2twk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: Krabador <krabador@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T3RoZXIgaW5mb3JtYXRpb24gcmVxdWlyZWQ/CgrigJDigJDigJDigJDigJDigJDigJAgT3JpZ2lu
YWwgTWVzc2FnZSDigJDigJDigJDigJDigJDigJDigJAKSWwgbWFydGVkw6wgMTggYWdvc3RvIDIw
MjAgMjI6MDEsIEtyYWJhZG9yIDxrcmFiYWRvckBwcm90b25tYWlsLmNvbT4gaGEgc2NyaXR0bzoK
Cj4gSGkgYWxzYS1kZXZlbCB0ZWFtLgo+IFRoaXMgZGV2aWNlIGZyb20gbGludXggZnJvbSA1LjIg
KG15IGZpcnN0IHBsdWcpIHRvIG5vdyB3aXRoIDUuOC4xLCB0aGUgb25seSB3YXkgdG8gdXNlIGl0
IHByb3Blcmx5IGlzIHRvIHJ1biBsaW51eCBhZnRlciB3aW5kb3dzIHJlYm9vdC4gSWYgbGludXgg
aXMgcnVuIGF0IHBvd2Vyb24sIHRoZSBkZXZpY2UgaXMgY29ycmVjdGx5IHNlZW4gYnkgdGhlIGtl
cm5lbCBidXQgbXV0ZWQuCj4gSGVyZSB0aGUgcmVzdWx0cyBvZiBhbHNhLWluZm8uc2ggd2hlbiBj
YXJkIGlzIHdvcmtpbmcgLCBub3Qgd29ya2luZywgYSBkaWZmLCBkbWVzZyBhbmQgbHN1c2IgLXYK
Pgo+IGh0dHBzOi8vcGFzdGUuZWUvcC9ZckpTUCNwUm12UTU4VDdzQ2V1bEhyMVpTbHV3MmNUUXQ3
ZXhzaAo+Cj4gV2FpdGluZyB0byBnaXZlIG1vcmUgaW5mb3JtYXRpb24sCj4KPiBCZXN0IFJlZ2Fy
ZHMu
