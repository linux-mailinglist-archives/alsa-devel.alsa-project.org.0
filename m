Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CD47950C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 20:46:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE09A28BC;
	Fri, 17 Dec 2021 20:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE09A28BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639770412;
	bh=J5j4br+cuPBIYGTEsVxP+4TFc9OjTOLjVhyhpRlRmmE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AlWAg/PiOSnCYeo4pL3VrMArRLRerKN1FPhNZc06dftF0I6jNcYB+D5hGAgZEuI7a
	 JNGbMTpZ9mLEG21RqnF4JJe3yV33Z5jgkWiW+zC/vtuIA7m9F3mJX038a78l/5kOWX
	 fNl2cIMZ5RdmylrsexDtv9KJttjzjF5M81aihyBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC34F8016D;
	Fri, 17 Dec 2021 20:45:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4FDDF80163; Fri, 17 Dec 2021 20:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3EB0F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 20:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3EB0F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="Lk3dCsMv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=r5hAFbzU84fp839AgY5U1YfncuesOFSzXjZ7b8sVRaI=; b=Lk3dC
 sMvlhm1NDr5WtSc72UlGhdIuwG8X43J0XHNQvQj5PvNE2P1GwdARCT6FHAjftypeUx8RD4PQEzlMa
 jizydfPDflDQtF+RISEgqSybT6M6MH+bUxwyCI3SCGaQbb1320WbtWYlkuZU+R/mYtJBukNDLbvqg
 eAKwbXjMGS6NtV+7MiMx6paJ7120mbT5Rk5HN/2aHzh6kOO49QompAv9GkmgUXPr6moZ/J44Q4t4D
 8e/GeimMS1jT6wxKNjSGhr/PxFuBfIef+4cfDFljZ7jUABAhbRz/c+iC80GBSabh0IhPgscoRCMxw
 vY0GS3I3Q4poD6l/c95uqyRrekEDw==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1myJAb-0005hE-75; Fri, 17 Dec 2021 19:45:33 +0000
Date: Fri, 17 Dec 2021 19:45:32 +0000
From: John Keeping <john@metanate.com>
To: Kolten Pearson <koltenpearson@gmail.com>
Subject: Re: rawmidi driver dropping some sysex commands
Message-ID: <Ybzo3C8H9pSTxpqq@donbot>
References: <CAC0M1CVW=3vizh8MYxPRVtBqNtOiChYfReYJ2SrY7TkKP0Dg7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC0M1CVW=3vizh8MYxPRVtBqNtOiChYfReYJ2SrY7TkKP0Dg7A@mail.gmail.com>
X-Authenticated: YES
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

On Thu, Dec 09, 2021 at 09:31:12PM -0700, Kolten Pearson wrote:
> I have been working on reverse engineering the sysex commands to
> control an Arturia MiniLab mkII controller, and have run into an issue
> where the rawmidi driver is dropping some of the commands.
> Here is a snippet of my code that illustrates the problem
> ---
> snd_rawmidi_t* midi_input;
> snd_rawmidi_t* midi_output;
> 
> void midi_init() {
>     int ret = snd_rawmidi_open(&midi_input, &midi_output, "hw:3,0,0",
> SND_RAWMIDI_NONBLOCK);

You're opening in non-blocking mode here, which may affect the behaviour
later...

>     int count = snd_rawmidi_write(midi_output, raw_command,
> sizeof(raw_command));
>     assert(count == sizeof(raw_command) && "bad write");

Are you definitely compiling with these asserts enabled?  Have you
considered:

	if (count != sizeof(raw_command))
		warnx("bad write");

>     //SDL_Delay(1);
>     int ret = snd_rawmidi_drain(midi_output);
>     assert(ret == 0 && "could not drain");
> }
> ---
> When this code is run, the minilab will only respond to a
> nondeterministic number of calls to the midi_set function and ignore
> the rest.
> However if the SDL_Delay(1) line is uncommented, it will work
> correctly every time (This function call causes the process to sleep
> for at least 1 millisecond).
> 
> I feel like the call to snd_rawmidi_drain should make the SDL_Delay
> call unnecessary, but that is not the case. Is there something I am
> not understanding about how the api works?

How is the Arturia device connected?  Is it USB?

I wonder if it is the device that is dropping the data.  Normally USB
MIDI devices will NAK transfers if they are unable to process data but
maybe that is not happening here.

You may be able to use usbmon and Wireshark to capture the USB traffic
to the device and confirm whether the data is being sent over the bus or
if it is being lost in the rawmidi layer somehow.
