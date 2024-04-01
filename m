Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEDF89465D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 23:00:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7795C21A4;
	Mon,  1 Apr 2024 22:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7795C21A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712005205;
	bh=qOKu0j1jHjWak8NWEMArNn1c7IPJ74vWpBjcq6aqx40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nFLosS6ibYUBur4k9fJlekw6nm/b1dz+kwlGUKZ6g1GJCtJCXr6zOk7Y/5ZrRrO7u
	 3anWMk/h86gTgd4auODOOnvvN2ETQvUEMwFceSE7BMCW8hOj4SAw20c/hIy9inVozy
	 P5BJMumym+A37wOVPKLEYnuoII5E1xRU/rNrdSF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A956F80588; Mon,  1 Apr 2024 22:59:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CB7CF8020D;
	Mon,  1 Apr 2024 22:59:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4709FF80236; Mon,  1 Apr 2024 22:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E8CAF80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 22:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E8CAF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.a=rsa-sha256 header.s=pandora-2019 header.b=f8T4aqgp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e6NtpTZUe0UZWacVoM0z4bqS0fsIhMNTH8nloW8cIkk=; b=f8T4aqgptO8+UI6x0ryzvq5YFb
	91k43AFdUUAldl22OhVjO+JxQ2h16B7urSgmF1SkmZErVcSNyQ4wldRM86N0TsO2HVwc0L6JqezFp
	1LlYXz2Q9OaLzZSw7IzqM64Tm7b3xbCWb3GVQLRUC+W5w22siyULGbTrh6reM/upy9jbAQU/YJDcw
	xEx/9KF0Fx3Ns2cyVPh6cRHQAl77DpWY/hlH2IKM8uY45l9hAP8I+e1nzNn2n6hwOlunk1A4x+6Qz
	J/BU3pXvKysT+2WkEhT0PgUcTZFA/IOV+/0esInrFGGzF/O3IRT3h0nKZ63zIonKYNU40XUi0gEyf
	9AWy82EQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34212)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrOkI-0005Lp-2O;
	Mon, 01 Apr 2024 21:59:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrOkI-0005sX-4c; Mon, 01 Apr 2024 21:59:10 +0100
Date: Mon, 1 Apr 2024 21:59:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgsgHiFbbmjuD+tT@shell.armlinux.org.uk>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
 <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
 <ZgqeV4M8DGpl6KHJ@ugly>
 <Zgq33GqYqtln0qyX@shell.armlinux.org.uk>
 <ZgrCEU6rHuEtT6/8@ugly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgrCEU6rHuEtT6/8@ugly>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Message-ID-Hash: OKLNYFGN4SM27CSQ5GRTVBZMCP5XXWNO
X-Message-ID-Hash: OKLNYFGN4SM27CSQ5GRTVBZMCP5XXWNO
X-MailFrom: linux+alsa-devel=alsa-project.org@armlinux.org.uk
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKLNYFGN4SM27CSQ5GRTVBZMCP5XXWNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 04:17:53PM +0200, Oswald Buddenhagen wrote:
> On Mon, Apr 01, 2024 at 02:34:20PM +0100, Russell King (Oracle) wrote:
> > Oh FFS. So you generated a patch based on the contents of a mere
> > comment? That is NOT how kernel development should be done. Do not do
> > this.
> > 
> i think that speculative/rfc patches are a perfectly fine way to get
> things clarified, and the linux kernel is no exception to that.

This wasn't a "speculative/rfc" patch. Such patches get marked with
"RFC" in the tag.

> > Comments are not always correct.
> > 
> so how about taking the opportunity to fix this one?

I don't think this comment is incorrect.

"ALSA wants the byte-size of the FIFOs."

That is a fact when the flag you refer to is not set.

"As we only support 16-bit samples"

That is also a fact - the driver doesn't support anything but 16-bit
samples.

"this is twice the FIFO depth irrespective of whether it's in compact
mode or not."

The only ambiguity there is what "compact" mode is, and one can find
that out by reading the documentation referenced at the top of the file
which is a public document.

Why should the comment go into all the nitty gritty that is described
in the _public_ document, like "the FIFO is shared between all channels"
and "the FIFO has a fixed width". Maybe it should also state that
compact mode is reading 32-bits per transfer and thus takes up two FIFO
entries. Maybe it should describe that each 32-bit transfer contains
two samples. Maybe it should describe the bit order of those samples.
Maybe it should describe what a computer is as well?

At some point, knowledge has to be assumed. I assume that, because the
public document is referenced at the top of the file, anyone who wishes
to patch this driver should refer to the public documentation to get an
understanding of the hardware first.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
