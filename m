Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC36A1E90
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:12:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C1B1707;
	Thu, 29 Aug 2019 17:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C1B1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091576;
	bh=qYhH7bULAE1PyEXeh2liXwkdgPa4x1tQTp9ymYzwKIg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjC9lnYjMUG88bBSx3n6V3Di1UC5dUbts5J8za08Uxizjr7jbzpbbn8um/+zih1t/
	 d7Td/Vmx1sQNHLxVu13UfKOEFFCqEbArcTOv1kUi7Lu/qcI7AQw9/Go+FFxZ2ymg+I
	 cYeVEbmypH0EH9bZ+JGR9KKhlH0ztec9yb7ggNxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F8CF89614;
	Wed, 28 Aug 2019 00:40:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6786F80CC1; Wed, 28 Aug 2019 00:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.lekensteyn.nl (mail.lekensteyn.nl
 [IPv6:2a02:2308::360:1:25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1B5F80CC1
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1B5F80CC1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lekensteyn.nl header.i=@lekensteyn.nl
 header.b="MGqMIq0T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lekensteyn.nl; s=s2048-2015-q1; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=W755SOjG26JPvvqPajc576xDrzJZD3HASrkXEzOzrLI=; 
 b=MGqMIq0TngzkjMrWN5ZznKdYTGRhaljhOyJFFa+R6hRDSBkhAifGf90vBV7+/zirmtsd3rsBO7SNclUcIx4Ll+F04TZC+iFvDmAoaACRWQHBYBgEZLtyWil+tRQAHg8XJbBxWywM2XkqUw4d9tkv/vzoVzu/uhwNF+mn1UrtZBwxqfo15hEPadoZ5cHaV731KoG5hJUWNqx3k+44s1x3UbPVj0B9O9n05yQtgvFYhx6wZEE7DIb6UomxHiUuML0NEXDEzmHBZLQ1TKArcthzqo5Sg5EAlCehV9qcbpKL+pryg5irvWfM/IcTpr+iChvGGYkX2FQdT2psvHeRGqGU5Q==;
Received: by lekensteyn.nl with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <peter@lekensteyn.nl>)
 id 1i2k81-0001HF-Ng; Wed, 28 Aug 2019 00:39:54 +0200
Date: Tue, 27 Aug 2019 23:39:51 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20190827223951.GA27744@al>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <s5hr2567hrd.wl-tiwai@suse.de>
 <0379E973-651A-442C-AF74-51702388F55D@canonical.com>
 <20190827221321.GA9987@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827221321.GA9987@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Dave Airlie <airlied@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] PCI: Add a helper to check Power
 Resource Requirements _PR3 existence
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 27, 2019 at 05:13:21PM -0500, Bjorn Helgaas wrote:
> [+cc Peter, Mika, Dave]
> 
> https://lore.kernel.org/r/20190827134756.10807-1-kai.heng.feng@canonical.com
> 
> On Wed, Aug 28, 2019 at 12:58:28AM +0800, Kai-Heng Feng wrote:
> > at 23:25, Takashi Iwai <tiwai@suse.de> wrote:
> > > On Tue, 27 Aug 2019 15:47:55 +0200,
> > > Kai-Heng Feng wrote:
> > > > A driver may want to know the existence of _PR3, to choose different
> > > > runtime suspend behavior. A user will be add in next patch.
> > > > 
> > > > This is mostly the same as nouveau_pr3_present().
> > > 
> > > Then it'd be nice to clean up the nouveau part, too?
> > 
> > nouveau_pr3_present() may call pci_d3cold_disable(), and my intention is to
> > only check the presence of _PR3 (i.e. a dGPU) without touching anything.
> 
> It looks like Peter added that code with 279cf3f23870
> ("drm/nouveau/acpi: use DSM if bridge does not support D3cold").
> 
> I don't understand the larger picture, but it is somewhat surprising
> that nouveau_pr3_present() *looks* like a simple predicate with no
> side-effects, but in fact it disables the use of D3cold in some cases.

The reason for disabling _PR3 from that point on is because mixing the
ACPI firmware code that uses power resources (_PR3) with the legacy
_DSM/_PS0/_PS3 methods to manage power states could break as that
combination is unlikely to be supported nor tested by firmware authors.

If a user sets /sys/bus/pci/devices/.../d3cold_allowed to 0, then the
pci_d3cold_disable call ensures that this action is remembered and
prevents power resources from being used again.

For example, compare this power resource _OFF code:
https://github.com/Lekensteyn/acpi-stuff/blob/b55f6bdb/dsl/Clevo_P651RA/ssdt3.dsl#L454-L471

with this legacy _PS0/_PS3 code:
https://github.com/Lekensteyn/acpi-stuff/blob/b55f6bdb/dsl/Clevo_P651RA/ssdt7.dsl#L113-L142

The power resource code checks the "MSD3" variable to check whether a
transition to OFF is required while the legacy _PS3 checks "DGPS". The
sequence PG00._OFF followed by _DSM (to to change "OPCE") and _PS3 might
trigger some device-specific code twice and could lead to lockups
(infinite loops polling for power state) or worse. I am not sure if I
have ever tested this scenario however.

> If the disable were moved to the caller, Kai-Heng's new interface
> could be used both places.

Moving the pci_d3cold_disable call to the caller looks reasonable to me.
After the first patch gets merged, nouveau could use something like:

    *has_pr3 = pci_pr3_present(pdev);
    if (*has_pr3 && !pdev->bridge_d3) {
        /*
         * ...
         */
        pci_d3cold_disable(pdev);
        *has_pr3 = false;
    }


For the 1/2 patch,
Reviewed-by: Peter Wu <peter@lekensteyn.nl>
-- 
Kind regards,
Peter Wu
https://lekensteyn.nl
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
