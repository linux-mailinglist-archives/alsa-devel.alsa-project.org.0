Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C768E894785
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 01:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E7D210F;
	Tue,  2 Apr 2024 01:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E7D210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712012532;
	bh=stll1hb4WB0NpS3MmRop+OuEJBRjIyLWPvvZUq+Zwvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K9hSfcSEKUyPP7s+9QEBJC04qvXKpXdKMc5N0+entRfE6ncDjLc8E7LAd8fK2Y5Df
	 laqXSiXxu+rzTpcQGZ6t/Uf8SfZISGEc+i9l4fwxLVujJ6LPuhoyDOsqp4c6rqIUHb
	 FVy3ETxSCk9NnBguUfJC77DCw19krMR73XeHYLLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 549C3F805AC; Tue,  2 Apr 2024 01:01:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE7CF805A1;
	Tue,  2 Apr 2024 01:01:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F4092F80236; Tue,  2 Apr 2024 01:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF624F8016E
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 01:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF624F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ipQkNkZ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712012485; x=1712617285;
	i=oswald.buddenhagen@gmx.de;
	bh=stll1hb4WB0NpS3MmRop+OuEJBRjIyLWPvvZUq+Zwvw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=ipQkNkZ4HJUMQK3u/2W5vHJ4XHtHSAl/BhhdFsMvoIpqvtbjTq9i0+Wb2IjbOulJ
	 kV0s/Faf2Q/xHMEBz0Q1AoIbXmRgs70pIwnzWTK28OqJTKBOtdtO29EvBr2na9jKz
	 9pd7pbUDDND+dWbU9xcK0MWHCiJ9a9yReGGZwoZEtdGmAfUuIAnE/hddSjlsjKD+m
	 nYMiWyknCaHjCp2vRkWmVt6va5CI+pNAfKDPFLGiu0kTftlCwyJMnkQ4M2iWyU0K9
	 yMWEfW4yJTQeFrUw0P1Cc4jpbys4tRfmjc66ZH6YmDKEQ915aVuJmXLey0S9D9Hy4
	 l7SS3JrI1Zw4RxLiSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1rzN9L3Zyd-009dDv; Tue, 02
 Apr 2024 01:01:24 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrQea-QKJ-00; Tue, 02 Apr 2024 01:01:24 +0200
Date: Tue, 2 Apr 2024 01:01:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <Zgs8xAB3a6zWc0w6@ugly>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
 <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
 <ZgqeV4M8DGpl6KHJ@ugly>
 <Zgq33GqYqtln0qyX@shell.armlinux.org.uk>
 <ZgrCEU6rHuEtT6/8@ugly>
 <ZgsgHiFbbmjuD+tT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZgsgHiFbbmjuD+tT@shell.armlinux.org.uk>
X-Provags-ID: V03:K1:QM7UOKlcwcA+JhU/MHQeMXNH68z2A4fZpDttPjm3bb1fPxoMHDf
 3PYKAs1CFLt1N/9+YQYYC2qkwjhjvOC+o/CxmYlIsJuiBByj0NFr/fD0hUnhTTpwdpClI6i
 M/RINM7Y/K4vGLvDRf0t54gitJRA+nOw8Dq9DgA401I9tRNdkzmes79CcgusFWSm7/byZ+e
 n0RhaMtmSHSygGR5OVGgQ==
UI-OutboundReport: notjunk:1;M01:P0:YDe5SrxQxDw=;G4yMFVJf9XhStMSDGpHlWUBpi/J
 VLXAv9qhT6urTvAv2MLAfnNC5DDVLfDTe6pmtrxgDiCHzTSnPrOb/JnJyf7HoJJJ/1mAfK1nn
 /bmYdZrpmQq3q7fE0BBh+phvZQu9c2AjfCPxQ40EF9i9eZ9K9hZy3iBexoK+4FzRdaJs+y877
 3ea+N7B/7rpEhHkq7O/A4RUuzY9iW9ynil/ccP63yCNsCI16o7or+904NeTBYlgF4vzjpv2CG
 /fRvePmI3fH+0f3cHi8DdPmJg5GxQvf34T0cN3rBv5+P7lfb5b+tPPl0TzhlmojWMDX22DtJX
 +CoH6HKryyhx93rC4JGp8aYBYnqAE1aEkRynV2l8vMIiqwLOzYi4j/Wj85qhgv9E5P0NjiyiF
 O99mSAoNq60QX1eXwBYRFKiSnTvjdOxPBQADLKezD01qfc4QeDMB4NMOn028OBiUhQHG/aLYg
 SXllBzvzI4kHWqTD+ZKNMLNqEWoMa3T9oUHEJJQMILmYQQeszGoZoHB3gt8IyokZup7MKEk/g
 U+Ytq/UzYz7mUuxxYmJLLXJ0o/zGiI546oQBNsioFmLQ82fspuiyka2XvdlrI3WWrM3s8B53S
 Qrm975dchR0zUprJCNYCKPCpTmXIu0geq5haUm9V8T7vBz/nFjTf2DDR7S6nKUu+Hvx2ncI0j
 oKhky9y3sPjOTahPyG9oxNw71jNdakISWtlMPoOXFfmgiReCjc1pUXIOzmSCqeV5omYoqCveU
 7BoOOJGCEYSRL6rgwoIgzOZsKhtf70pdTLS2rcur1HBLgSiVWPUZQGz+/VxARcOEX1s6Lw9pP
 iCoZ4QNk5/jtuH5RbC6enolmYV3JufCCmMXNKqsoGvFCU=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IQAYGR4FINCJXWHVF2J2J7KNSCDU6YLS
X-Message-ID-Hash: IQAYGR4FINCJXWHVF2J2J7KNSCDU6YLS
X-MailFrom: oswald.buddenhagen@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQAYGR4FINCJXWHVF2J2J7KNSCDU6YLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 09:59:10PM +0100, Russell King (Oracle) wrote:
>On Mon, Apr 01, 2024 at 04:17:53PM +0200, Oswald Buddenhagen wrote:
>> i think that speculative/rfc patches are a perfectly fine way to get
>> things clarified, and the linux kernel is no exception to that.
>
>This wasn't a "speculative/rfc" patch. Such patches get marked with
>"RFC" in the tag.
>
putting an obvious disclaimer/question section after a three-dash line
is a perfectly sufficient way to mark such a patch. at least if the
receiver is actually interested in cooperation rather than harping on
formalities.

>> > Comments are not always correct.
>> >
>> so how about taking the opportunity to fix this one?
>
>I don't think this comment is incorrect.
>
>"ALSA wants the byte-size of the FIFOs."
>
>That is a fact when the flag you refer to is not set.
>
yet the formulation also suggests that this is something that just is,
rather than something that the code has control over.

>[...]
>At some point, knowledge has to be assumed.
>
the problem is the omission of specific information that is in this
context at least as pertinent as the information that _was_ supplied.

the code is also somewhat special in that it implements an interface,
which makes it more likely to be "visited" by outsiders than some
implementation details. it makes sense to take that into account in
related comments.
