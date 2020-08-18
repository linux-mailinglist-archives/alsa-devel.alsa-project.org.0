Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A97E3248F52
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 22:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5093F178C;
	Tue, 18 Aug 2020 22:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5093F178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597781025;
	bh=GTSraIlT2BUyDrjtoeRrEvCKr9V40jWagzSCblitj7U=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=LKOVBV5FAETayj6qNGbSuj545uSJqUAojOs37/Qga50sq3kz5J8Y3KWGb+4KV5UiO
	 oDWITcl1AybRcWxwl2jBsLe1i4sd7H6rfMXKknXddzn+yC97p9TgboVqYKaBlMCB/m
	 tHh9uQ0M2Y2m0I90Gza4CD6NRCCW6ChjlU5mDl+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7010DF80273;
	Tue, 18 Aug 2020 22:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABBC8F8023F; Tue, 18 Aug 2020 22:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL, 
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D2EBF80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 22:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D2EBF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="T4asaIpo"
Date: Tue, 18 Aug 2020 20:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1597780910;
 bh=zUELQLMecEUTOAo0Hj4RqzQcmaAEQcKoc/M9DlRp8fE=;
 h=Date:To:From:Reply-To:Subject:From;
 b=T4asaIpo3zw5sRdaKPiTiP29Hqi7ftbGEZo8he6XI/EJmexxkAR92ME9KHfhi+N4w
 pofhDazN9Kh5mm64+U3VeFvLOso1pHEYLUa3vusZY/kDk3X3C1m6HhX9GNdoAutWvv
 dMBBx28WqdBjUjLAKsv4u8EpvVHfQ7RH/o3+4Tj4=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Krabador <krabador@protonmail.com>
Subject: JamVOX usb soundcard works only after windows reboot
Message-ID: <0ADdOsEQXMKYMVgDetd2Jh24_GZwyWhL4pTKPva9kGKj6RcAbF14tuapZzJEJoYiuPuTRwzXYGFhyl6nOnUfzLRXAIFQfegQpOP3qxv2twk=@protonmail.com>
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

SGkgYWxzYS1kZXZlbCB0ZWFtLgpUaGlzIGRldmljZSBmcm9tIGxpbnV4IGZyb20gNS4yIChteSBm
aXJzdCBwbHVnKSB0byBub3cgd2l0aCA1LjguMSwgdGhlIG9ubHkgd2F5IHRvIHVzZSBpdCBwcm9w
ZXJseSBpcyB0byBydW4gbGludXggYWZ0ZXIgd2luZG93cyByZWJvb3QuIElmIGxpbnV4IGlzIHJ1
biBhdCBwb3dlcm9uLCB0aGUgZGV2aWNlIGlzIGNvcnJlY3RseSBzZWVuIGJ5IHRoZSBrZXJuZWwg
YnV0IG11dGVkLgpIZXJlIHRoZSByZXN1bHRzIG9mIGFsc2EtaW5mby5zaCB3aGVuIGNhcmQgaXMg
d29ya2luZyAsIG5vdCB3b3JraW5nLCBhIGRpZmYsIGRtZXNnIGFuZCBsc3VzYiAtdgoKaHR0cHM6
Ly9wYXN0ZS5lZS9wL1lySlNQI3BSbXZRNThUN3NDZXVsSHIxWlNsdXcyY1RRdDdleHNoCgpXYWl0
aW5nIHRvIGdpdmUgbW9yZSBpbmZvcm1hdGlvbiwKCkJlc3QgUmVnYXJkcy4=
