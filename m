Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A320F67B6F3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 17:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128771FB;
	Wed, 25 Jan 2023 17:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128771FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674664201;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m2ez4b/Uo3ntmoH7DcSU/0d8yh6hsu6hkKJPri8F/d/edM+0TRioVnQXzhxnbZSoD
	 oxqEEZ7uPmkj2+fk27eBZ/q3WNHkeFQDo6atBjugSKOWwbcuc0bQEvmHVN1eJGc4oA
	 TyoEqWxvmKkSf8gyiXDcXSd0khp9deqU+tVwrkRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16573F800AE;
	Wed, 25 Jan 2023 17:29:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30E13F802E8; Wed, 25 Jan 2023 17:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC81AF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 17:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC81AF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=G9fLi44m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674664126; bh=MwGCgZCa0ZAwgTdGagV0PnHQy3i5AXOHDInRTdPQ1BM=;
 h=X-UI-Sender-Class:Date:Subject:From:To;
 b=G9fLi44mMFiHYmQMUzXJgOpDYiTax8jSQtQNohXZ1KZOBPt55kJLfIB6S95YDkUC7
 UipKeXzciGMFeiLwV8IZt6X3oRoMCbOLC4X++UBlEpd3lCq+Blsfz+d92HjqYJfeV9
 t+wSddDXOlL7duwXtztATEGpv+QMk+q+ANXHQPzSJpluau2dPoHx1GyEIRcc4j8fXi
 tFksHnIsqI33VIOoAAsGAMaAa+GwSDxlRSAkOWM/nIxyRYQ4NTUtw3kzlMgb5lQ2mF
 fb5gDylraR1OFIcQ03tbmym3DNrIROdpkcZ7eISMNi8xP3fcQqbLA+3smRrBo5qd3/
 1Twn+mA8xHT/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.66] ([77.20.255.95]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1pBsx34BYO-00QPJ5 for
 <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 17:28:46 +0100
Date: Wed, 25 Jan 2023 17:28:44 +0100
Subject: Firewire ALSA Motu and Phase24
X-Priority: 3
Message-ID: <sokos1-r6xj933yn42y-hmy3gsrfgsma-mnwe9a-cahiug-3btbiljo1il7-8lhisz-trzq63b9es27-41z6o2wylkgf-tjvaeo3olqkz-elr571-us6u4977mlo1-p2gxkncmroem-foujcu-jg85lg-sqi612.1674640678660@email.android.com>
From: "M. Armsby" <m.armsby@gmx.de>
To: ALSA mail List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:W/+z9g+vIkNiAQMS0JUoiIAtnY2CxZ/veGqMazI26WppH6PDHJ2
 lr54yvpu3dalstTUReT1LjTI/HUssiyCQOZduaaGd64HgTrwyCBambKdPpEY4vpkSTH4tHJ
 TZ25lsvquYFanVpMwhmHlGmAdQAF9wXtwqW5xtt4ilVwMkebxnxbdn+cxM+QdiKm53kMfyn
 FD3jhQV5FkTr8snl4w3wQ==
UI-OutboundReport: notjunk:1;M01:P0:DN8vp+h08s0=;nXnvu87xvinFTiqE8cbTQXrH/vw
 +bGHq3sizbRQe5MlnQ4PW118Kl8RNP418d5ZdwSdGNjJsBrchIo8N3anjDzK7tc1KapNmXrRp
 WQMnvqUQy4NGGICrf5i0DpWIrtzMbxyYQonXWSbH4JZaD9PrUGlai1RF73MNn3JuAhsmQbVPQ
 tRRHRlo1UXL90E6zaiGGtc9ohgsctbjPBr20Ds0LyiJI2SDMTCxx3xJaqk+zcwE+w7DDrMjUW
 XAH/7tSTWbCLNBpTp+cZRnc6Mx5tRPHAQBiXIva0yJ8306e022eTqPewYouTsa1iDx57iDe7W
 tf9cVb2c6dYy9Xvjr3rB+rU6BCX6dwimoYp7CnVIBjFfqeVUXbZr+g6Z7VOdYTH9hK/kQnnAY
 Y+jcVTuKaEOYb7ga91l1A8oNNUgu0KRYHhtAce1KoqTc3IxBR7CjNOUGbkoDzQJjhQlbn2VNm
 wxQlgazbgi3pbxZbxmMdt24JdotJLVk8Z9l1vuUNsIJSZNpGYd2iuA6HDesXQcFELjGQh3shl
 moOWPhSn5+m4O6Cl43O1kHLOJgRwUgrggLrTtt5/XyMZc+LDDJJKMRsNVzvGNemQNLphJnux+
 TQoq07GHkT3jm8BHki/FPjZbXSc+C0UmkDCoIl7or/wUNSXyMTCOZZV30ujGJXqC+ijyIGMvX
 XKFl7xAAstgAA034iqBp/Agv+NiaVgSzSGdFgBFDg67jI79cOivm4EhLv44cV5taeQzN8rbnB
 hGCA21LTwPL4KdHSyDCss32h/i/EDNFpvhYEh+tAjuThz+TybJYvqWVuiaJqUliZOTMKErIEu
 RXHt42/bsNShiJ/5rEtewfQqQkmb/+uXD7uQgXoVttJyPZPf6hJ9G5Ra9olyhvYV43Sf+lrgA
 +byTBAIkSBptyzexeNM9eWTjQ5UM/JoYuT1w5HFPXG+i8nPW64n2hjbGHDXZT7f8qrskvFXqS
 S7h0NFi/AG7W5fT5O+Xk+p1QrDQ=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

