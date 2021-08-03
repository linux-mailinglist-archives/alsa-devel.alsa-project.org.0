Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523003DE764
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 09:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5CE0171C;
	Tue,  3 Aug 2021 09:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5CE0171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627976560;
	bh=6LYXDCvxKNmbd06NVoftvtRjNKvz73gVn1uLRqdCrK0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eB9l9NFq8sCScyGUae7Ulgr7v0pGfhms7oWC7oaNT54r4PBCf1z9YZcXz4wMybU90
	 ST8nOj8DWaRKd4mV/n+U+QcegWeGQMnDVWImUPIs1uXVUdzCKW/qSG1mM+g/A5fd8r
	 OZcNWVUpBcZtcBBUR5tw3mQ6e0nmKPo7U9VpbhW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FF0F804AB;
	Tue,  3 Aug 2021 09:41:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6263AF8032D; Tue,  3 Aug 2021 09:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CDD8F802E8
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 09:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDD8F802E8
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id Ap2hmSmPMXTlcAp2imkFQR; Tue, 03 Aug 2021 09:40:52 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 867D3162670;
 Tue,  3 Aug 2021 09:40:51 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Dsl6kWR09OEZ; Tue,  3 Aug 2021 09:40:50 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 4BBEB1626F6;
 Tue,  3 Aug 2021 09:40:50 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 3D3CA16097B; Tue,  3 Aug 2021 09:40:50 +0200 (CEST)
Date: Tue, 3 Aug 2021 09:40:50 +0200
From: folkert <folkert@vanheusden.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: aconnect occasionally causes kernel oopses
Message-ID: <20210803074050.GX890690@belle.intranet.vanheusden.com>
References: <20210801182754.GP890690@belle.intranet.vanheusden.com>
 <s5hlf5kz80e.wl-tiwai@suse.de>
 <20210802061845.GQ890690@belle.intranet.vanheusden.com>
 <s5him0oz5zq.wl-tiwai@suse.de>
 <20210802091012.GR890690@belle.intranet.vanheusden.com>
 <s5hczqvyj8m.wl-tiwai@suse.de>
 <20210802152117.GT890690@belle.intranet.vanheusden.com>
 <s5h5ywnydlz.wl-tiwai@suse.de>
 <20210802195349.GV890690@belle.intranet.vanheusden.com>
 <s5h1r7bxbiv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1r7bxbiv.wl-tiwai@suse.de>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfFZM7+jfDtagWCvUgn2zMUONoLsWyglexul12ZwALTnU5RfaXmnORB1z+le+sSoGDcbr2gdyfQgG1eJrTszql/npK/ZzHtWfH1ClGhibgxzzlb9hXDEh
 wpz3TQ+NqrV+Pg0Kry+aWuafx5y1K130GZM0GlWoqb315FXBm/5p3dgCgKzAXOkRvyID6IsbfunEtwOIzPxcMA2ea7kyvEY7Ztw3Z6zkbGIhxIXxUxJVpjtt
 BPIxSrkFNVQc0kHziJw4oA==
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

To which kernel version should I apply it?
Because:

folkert@oensoens:~/linux-5.11.0$ patch -p1 < ~/alsa-patch.diff 
patching file sound/core/seq/seq_ports.c
patching file sound/core/seq/seq_ports.h
patching file sound/core/seq/seq_ports.c
Hunk #1 succeeded at 526 (offset 12 lines).
Hunk #2 succeeded at 538 (offset 12 lines).
Hunk #3 succeeded at 547 with fuzz 2 (offset 12 lines).
Hunk #4 FAILED at 602.
1 out of 4 hunks FAILED -- saving rejects to file sound/core/seq/seq_ports.c.rej

On Tue, Aug 03, 2021 at 08:55:36AM +0200, Takashi Iwai wrote:
> On Mon, 02 Aug 2021 21:53:49 +0200,
> folkert wrote:
> > 
> > > > [ kernel bug if repeatingly aconnect'ing midi devices ]
> > > > 
> > > > > Does this happen if you do reconnect of kernel sequencer client?
> > > > > You can use snd-virmidi as well as snd-dummy.
> > > > > I'm asking it because it'll simplify the test a lot, which will be
> > > > > almost self-contained.
> > > > 
> > > > Like this?
> > > > 
> > > > root@lappiemctopface:~# aplaymidi -l
> > > >  Port    Client name                      Port name
> > > >  14:0    Midi Through                     Midi Through Port-0
> > > >  20:0    Virtual Raw MIDI 1-0             VirMIDI 1-0
> > > >  21:0    Virtual Raw MIDI 1-1             VirMIDI 1-1
> > > >  22:0    Virtual Raw MIDI 1-2             VirMIDI 1-2
> > > >  23:0    Virtual Raw MIDI 1-3             VirMIDI 1-3
> > > > 128:0    rtpmidi lappiemctopface          Network
> > > > 128:1    rtpmidi lappiemctopface          metronoom
> > > > 128:2    rtpmidi lappiemctopface          AppleMidi2IPMidiBridge
> > > > 128:3    rtpmidi lappiemctopface          oensoens
> > > > 130:0    FLUID Synth (11462)              Synth input port (11462:0)
> > > > 
> > > > and then:
> > > > 
> > > > root@lappiemctopface:~# cat test.sh 
> > > > while true
> > > > do
> > > > 	aconnect 20:0 21:0
> > > > 	aconnect -d 20:0 21:0
> > > > done
> > > > 
> > > > root@lappiemctopface:~# for i in `seq 0 3` ; do (./test.sh &) ; done
> > > > 
> > > > This hard locks-up my laptop: it doesn't even respond to capslock (led
> > > > on/off) anymore nor the ctrl+prtscr+alt+b combination.
> > > 
> > > Thanks, that's really helpful!
> > > I see the possible race now.
> > 
> > > Could you try the quick fix below?
> > 
> > Something may have changed:
> > 
> > folkert@oensoens:~$ aplaymidi -l
> > ALSA lib seq_hw.c:466:(snd_seq_hw_open) open /dev/snd/seq failed: Permission denied
> > Cannot open sequencer - Permission denied
> > 
> > ???
> 
> Hrm, that's unexpected.
> 
> Meanwhile, I reconsidered the fix and a better idea came after the
> sleep.  Below is the new fix patch.  Could you give it a try instead
> of the previous one?
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: seq: Fix racy deletion of subscriber
> 
> It turned out that the current implementation of the port subscription
> is racy.  The subscription contains two linked lists, and we have to
> add to or delete from both lists.  Since both connection and
> disconnection procedures perform the same order for those two lists
> (i.e. src list, then dest list), when a deletion happens during a
> connection procedure, the src list may be deleted before the dest list
> addition completes, and this may lead to a use-after-free or an Oops,
> even though the access to both lists are protected via mutex.
> 
> The simple workaround for this race is to change the access order for
> the disconnection, namely, dest list, then src list.  This assures
> that the connection has been established when disconnecting, and also
> the concurrent deletion can be avoided.
> 
> Reported-by: folkert <folkert@vanheusden.com>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/r/20210801182754.GP890690@belle.intranet.vanheusden.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/seq/seq_ports.c | 39 ++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
> index b9c2ce2b8d5a..84d78630463e 100644
> --- a/sound/core/seq/seq_ports.c
> +++ b/sound/core/seq/seq_ports.c
> @@ -514,10 +514,11 @@ static int check_and_subscribe_port(struct snd_seq_client *client,
>  	return err;
>  }
>  
> -static void delete_and_unsubscribe_port(struct snd_seq_client *client,
> -					struct snd_seq_client_port *port,
> -					struct snd_seq_subscribers *subs,
> -					bool is_src, bool ack)
> +/* called with grp->list_mutex held */
> +static void __delete_and_unsubscribe_port(struct snd_seq_client *client,
> +					  struct snd_seq_client_port *port,
> +					  struct snd_seq_subscribers *subs,
> +					  bool is_src, bool ack)
>  {
>  	struct snd_seq_port_subs_info *grp;
>  	struct list_head *list;
> @@ -525,7 +526,6 @@ static void delete_and_unsubscribe_port(struct snd_seq_client *client,
>  
>  	grp = is_src ? &port->c_src : &port->c_dest;
>  	list = is_src ? &subs->src_list : &subs->dest_list;
> -	down_write(&grp->list_mutex);
>  	write_lock_irq(&grp->list_lock);
>  	empty = list_empty(list);
>  	if (!empty)
> @@ -535,6 +535,18 @@ static void delete_and_unsubscribe_port(struct snd_seq_client *client,
>  
>  	if (!empty)
>  		unsubscribe_port(client, port, grp, &subs->info, ack);
> +}
> +
> +static void delete_and_unsubscribe_port(struct snd_seq_client *client,
> +					struct snd_seq_client_port *port,
> +					struct snd_seq_subscribers *subs,
> +					bool is_src, bool ack)
> +{
> +	struct snd_seq_port_subs_info *grp;
> +
> +	grp = is_src ? &port->c_src : &port->c_dest;
> +	down_write(&grp->list_mutex);
> +	__delete_and_unsubscribe_port(client, port, subs, is_src, ack);
>  	up_write(&grp->list_mutex);
>  }
>  
> @@ -590,27 +602,30 @@ int snd_seq_port_disconnect(struct snd_seq_client *connector,
>  			    struct snd_seq_client_port *dest_port,
>  			    struct snd_seq_port_subscribe *info)
>  {
> -	struct snd_seq_port_subs_info *src = &src_port->c_src;
> +	struct snd_seq_port_subs_info *dest = &dest_port->c_dest;
>  	struct snd_seq_subscribers *subs;
>  	int err = -ENOENT;
>  
> -	down_write(&src->list_mutex);
> +	/* always start from deleting the dest port for avoiding concurrent
> +	 * deletions
> +	 */
> +	down_write(&dest->list_mutex);
>  	/* look for the connection */
> -	list_for_each_entry(subs, &src->list_head, src_list) {
> +	list_for_each_entry(subs, &dest->list_head, dest_list) {
>  		if (match_subs_info(info, &subs->info)) {
> -			atomic_dec(&subs->ref_count); /* mark as not ready */
> +			__delete_and_unsubscribe_port(dest_client, dest_port,
> +						      subs, false,
> +						      connector->number != dest_client->number);
>  			err = 0;
>  			break;
>  		}
>  	}
> -	up_write(&src->list_mutex);
> +	up_write(&dest->list_mutex);
>  	if (err < 0)
>  		return err;
>  
>  	delete_and_unsubscribe_port(src_client, src_port, subs, true,
>  				    connector->number != src_client->number);
> -	delete_and_unsubscribe_port(dest_client, dest_port, subs, false,
> -				    connector->number != dest_client->number);
>  	kfree(subs);
>  	return 0;
>  }
> -- 
> 2.26.2


Folkert van Heusden

-- 
MultiTail is a versatile tool for watching logfiles and output of
commands. Filtering, coloring, merging, diff-view, etc.
http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
