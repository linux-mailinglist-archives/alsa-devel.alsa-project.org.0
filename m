Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37CCC24D18
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Oct 2025 12:43:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B0E6601D4;
	Fri, 31 Oct 2025 12:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B0E6601D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761911029;
	bh=NKQ8T0pe7+p6eoLd/y5VeVCAyeipEswnqFynO86BLyg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XMiSAI6p0DjEv3iTNSsjZW3jpkDR435dkabrq11cFqN4PbtPXDx6rl5kF+qv4X3nd
	 5ZbUoFvNfzBmbyIP4QSK8CCqcZRLdpEunSur52X8RJw1C3pPtzRvJ8K6K+ZuRfI6dO
	 uBeTJTeUf32dUHuKBVDmKV0ZqXThUYbdBKj50fI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E482CF805CA; Fri, 31 Oct 2025 12:43:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0625F805C8;
	Fri, 31 Oct 2025 12:43:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A02F8021D; Fri, 31 Oct 2025 12:42:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 87CC6F80071
	for <alsa-devel@alsa-project.org>; Fri, 31 Oct 2025 12:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87CC6F80071
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187390ad7f299d00-webhooks-bot@alsa-project.org>
In-Reply-To: <187390ad7edf2000-webhooks-bot@alsa-project.org>
References: <187390ad7edf2000-webhooks-bot@alsa-project.org>
Subject: amidirecord the metronome doesn't work
Date: Fri, 31 Oct 2025 12:42:40 +0100 (CET)
Message-ID-Hash: X77HRDF5FUOLJGA67DLICDIU5CB3MZXB
X-Message-ID-Hash: X77HRDF5FUOLJGA67DLICDIU5CB3MZXB
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X77HRDF5FUOLJGA67DLICDIU5CB3MZXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #307 was opened from MarcWeber:

This a bug report that arecordmidi's metronome doesn't work on my (nixos) linux
machine for whatever reason. Asking AI to fix it I couldn't really make it work.
It kept stopping after one measure.

So I asked to rewrite roughly with the following prompt:

- master / -slave (be metronome or use another time giving source) slave is not tested.

Because goal was to get readable clean nodes I asked to add new features:
--note-recording-on-switches-others-off
--note-recording-ignore-off

But the honest answer is using lmms like tool to record midi shows that getting
timing correct is too hard. So the only way to make this work I feel would be using A UI
app which allows to manually fix the timing of measures. But that would be a
totally different bloated app.


So typical usage of the code below would be:

```
arecordmidi --debug --master \
  --note-recording-on-switches-others-off --note-recording-ignore-off \
  -p 24:0 -m 128:1 -i 4:4 -t 50 /tmp/out.mid 
```

But I still wasn't able to cleanly record "Alle meine Entchen" which only is
made up of quarter half and full note length.

The code below was done by Gemini Pro 2025-10-31 but it was fed with the
original code. I also applied some manual fixes to the AI code cause it kept failing on some things. So if AI is a programmer it probably is still GPL ? No idea.

So maybe test whether the metronome works for you if not add a simple patch
showing this issue (for now) so that people can compile the code below
themselves if they want to experimenfit with it. But they will have read the
warnings here understanding it might not be as easy as they think.

So I am not sure anymore the bug is worth fixing. But this issue allows
discusssing it. But its worth managing expectations of users  - thus drop the feature if it doesn't work or fix it by printf ("see this gituhb issue") for the time being.

Maybe the code is old and was written for older Alsa no idea. The metronome output wasn't even shown in qjackctl or aconnect -l. So this all at least works in the code below so that it can be experimented with. It also outputs the pressed notes with timing differences compared to ticks. But in the end you might be faster using lilypond or musescore to type notes.

```
/*
 * arecordmidi.c - record standard MIDI files from sequencer
 *
 * Copyright (c) 2004-2005 Clemens Ladisch <clemens@ladisch.de>
 * Copyright (c) 2024 Rewritten by AI based on user specification.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software

 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <signal.h>
#include <getopt.h>
#include <poll.h>
#include <errno.h>
#include <math.h>
#include <time.h> /* for clock_gettime */
#include <alsa/asoundlib.h>
#include "aconfig.h"
#include "version.h"

#define BUFFER_SIZE 4096
#define MAX_PORTS 16

/* --- Data Structures --- */

// Linked list of buffers to store SMF track data
struct buffer {
    struct buffer *next;
    unsigned char buf[BUFFER_SIZE];
};

// Represents a single track in a Standard MIDI File
struct smf_track {
    int size;
    int cur_buf_size;
    struct buffer *cur_buf;
    snd_seq_tick_time_t last_tick;
    unsigned char last_command;
    int used;
    struct buffer first_buf;
};

#define TRACKS_PER_PORT 17 // 1 for meta/sysex, 16 for channels

// Global application state
typedef struct {
    enum { MODE_UNSPECIFIED, MODE_MASTER, MODE_SLAVE } mode;
    const char *output_filename;
    FILE *file;

    snd_seq_t *seq;
    int client_id;
    int queue_id;

    char *record_in_addrs[MAX_PORTS];
    int record_in_count;
    char *metronome_out_addr;
    char *clock_in_addr;  // Slave only
    char *clock_out_addr; // Master only

    int record_in_port_ids[MAX_PORTS];
    int metronome_out_port_id;
    int metronome_loop_port_id;
    int clock_out_port_id;

    int bpm;
    int ticks_per_beat; // PPQ (Pulses Per Quarter Note)

    int use_metronome;
    int metro_channel;
    int metro_strong_note;
    int metro_weak_note;
    int metro_velocity;
    long metro_latency_ms;
    snd_seq_tick_time_t metro_tick_offset;
    int metro_running;

    int ts_num;
    int ts_den;
    int ts_den_pow2;

    int split_channels;
    int num_tracks;
    struct smf_track *tracks;

    volatile sig_atomic_t stop_request;
    int debug_mode;

    // New options
    int on_switches_others_off;
    int ignore_off;

    // For note duration calculation in debug mode
    snd_seq_tick_time_t active_note_start_tick[MAX_PORTS][16][128];

    // For timing reference in debug mode
    snd_seq_tick_time_t ref_tick;
    snd_seq_real_time_t ref_real_time;
    int queue_time_ref_set;

} arecordmidi_app_t;

static arecordmidi_app_t app = {0};

/* --- Error Handling & Memory --- */

static void fatal(const char *msg, ...) {
    va_list ap;
    va_start(ap, msg);
    fputs("Error: ", stderr);
    vfprintf(stderr, msg, ap); fflush(stdout);
    va_end(ap);
    fputc('\n', stderr);
    exit(EXIT_FAILURE);
}

static void check_mem(void *p) {
    if (!p)
        fatal("Out of memory");
}

static void check_snd(int err, const char *operation) {
    if (err < 0)
        fatal("ALSA Error: Cannot %s - %s", operation, snd_strerror(err));
}

/* --- SMF File Writing Utilities --- */

static void add_byte(struct smf_track *track, unsigned char byte) {
    if (track->cur_buf_size >= BUFFER_SIZE) {
        track->cur_buf->next = calloc(1, sizeof(struct buffer));
        check_mem(track->cur_buf->next);
        track->cur_buf = track->cur_buf->next;
        track->cur_buf_size = 0;
    }
    track->cur_buf->buf[track->cur_buf_size++] = byte;
    track->size++;
}

static void var_value(struct smf_track *track, unsigned int v) {
    unsigned long buffer = v & 0x7f;
    while ((v >>= 7) > 0) {
        buffer <<= 8;
        buffer |= 0x80 | (v & 0x7f);
    }
    while (1) {
        add_byte(track, buffer & 0xff);
        if (buffer & 0x80)
            buffer >>= 8;
        else
            break;
    }
}

static void delta_time(struct smf_track *track, const snd_seq_event_t *ev) {
    int diff = ev->time.tick - track->last_tick;
    if (diff < 0) diff = 0;
    var_value(track, diff);
    track->last_tick = ev->time.tick;
}

static void command(struct smf_track *track, unsigned char cmd) {
    if (cmd != track->last_command) {
        add_byte(track, cmd);
        track->last_command = cmd < 0xf0 ? cmd : 0;
    }
}

/* --- Metronome --- */

static void metronome_note(unsigned char note, unsigned int tick) {
    snd_seq_event_t ev;
    snd_seq_ev_clear(&ev);
    snd_seq_ev_set_source(&ev, app.metronome_out_port_id);
    snd_seq_ev_set_subs(&ev);
    snd_seq_ev_set_direct(&ev);

    unsigned int schedule_tick = tick > app.metro_tick_offset ? tick - app.metro_tick_offset : 0;

    if (app.debug_mode) {
        // printf("  OUT:METRO: Note On:  ch=%2d key=%3d vel=%3d @ tick %u\n", app.metro_channel, note, app.metro_velocity, schedule_tick);
    }

    // Note On
    snd_seq_ev_set_noteon(&ev, app.metro_channel, note, app.metro_velocity);
    snd_seq_ev_schedule_tick(&ev, app.queue_id, 0, schedule_tick); // Absolute schedule
    snd_seq_event_output(app.seq, &ev);

    // Note Off (short duration)
    snd_seq_ev_set_noteoff(&ev, app.metro_channel, note, 0);
    snd_seq_ev_schedule_tick(&ev, app.queue_id, 0, schedule_tick + app.ticks_per_beat / 4); // Absolute
    snd_seq_event_output(app.seq, &ev);
}

static void metronome_pattern(unsigned int tick) {
    unsigned int ticks_per_bar, t;
    int j;

    ticks_per_bar = app.ts_num * (app.ticks_per_beat * 4 / app.ts_den);
    t = tick;

    for (j = 0; j < app.ts_num; ++j) {
        metronome_note((j == 0) ? app.metro_strong_note : app.metro_weak_note, t);
        t += (app.ticks_per_beat * 4 / app.ts_den);
    }

    // Schedule a custom event to trigger the next bar
    unsigned int next_bar_tick = tick + ticks_per_bar;
    snd_seq_event_t ev;
    snd_seq_ev_clear(&ev);
    ev.type = SND_SEQ_EVENT_USR0;
    snd_seq_ev_schedule_tick(&ev, app.queue_id, 0, next_bar_tick); // Absolute schedule
    snd_seq_ev_set_source(&ev, app.metronome_loop_port_id);
    snd_seq_ev_set_dest(&ev, app.client_id, app.metronome_loop_port_id);
    snd_seq_event_output(app.seq, &ev);
    snd_seq_drain_output(app.seq);
}

static void start_metronome() {
    if (app.metro_running || !app.use_metronome) return;
    app.metro_running = 1;
    printf("Starting metronome.\n");

    // Get current tick to start metronome immediately
    snd_seq_queue_status_t *qstatus;
    snd_seq_queue_status_alloca(&qstatus);
    check_snd(snd_seq_get_queue_status(app.seq, app.queue_id, qstatus), "get queue status");
    snd_seq_tick_time_t current_tick = snd_seq_queue_status_get_tick_time(qstatus);

    metronome_pattern(current_tick);
}

/* --- Event Recording --- */

static const char *note_names[] = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
static const char *midi_note_to_name(int note, char *buf, size_t size) {
    if (note < 0 || note > 127) {
        snprintf(buf, size, "???");
    } else {
        int octave = (note / 12) - 1;
        const char *name = note_names[note % 12];
        snprintf(buf, size, "%s%d", name, octave);
    }
    return buf;
}

static void terminate_old_notes(int current_port_idx, const snd_seq_event_t *original_on_ev, const snd_seq_event_t *processed_on_ev)
{
    // If ticks_per_beat is not set, this feature is disabled to avoid division by zero.
    if (app.ticks_per_beat <= 0) return;

    unsigned int current_beat_tick = processed_on_ev->time.tick;

    for (int ch = 0; ch < 16; ++ch) {
        for (int nt = 0; nt < 128; ++nt) {
            snd_seq_tick_time_t start_tick = app.active_note_start_tick[current_port_idx][ch][nt];
            if (start_tick != (snd_seq_tick_time_t)-1) {
                // Don't terminate notes started on the same tick, to allow chords.
                if (current_beat_tick == start_tick) {
                    continue;
                }

                // Find the track for the note we are terminating
                int track_idx = current_port_idx;
                if (app.split_channels) {
                    track_idx = (track_idx * TRACKS_PER_PORT) + 1 + ch;
                }
                if (track_idx >= app.num_tracks) continue;
                struct smf_track *track = &app.tracks[track_idx];
                track->used = 1;

                // Create a synthetic event just to pass the correct tick time
                snd_seq_event_t off_ev;
                snd_seq_ev_clear(&off_ev);
                off_ev.time.tick = processed_on_ev->time.tick;

                // Record the NOTEOFF event
                delta_time(track, &off_ev);
                command(track, 0x80 | ch);
                add_byte(track, nt);
                add_byte(track, 0); // Standard velocity for note-off

                if (app.debug_mode) {
                    char note_name_buf[8];
                    midi_note_to_name(nt, note_name_buf, sizeof(note_name_buf));

                    double beat_pos = 0.0, offset_percent = 0.0;
                    long offset_ms = 0;
                    if (app.ticks_per_beat > 0 && app.bpm > 0 && app.queue_time_ref_set) {
                        beat_pos = (double)off_ev.time.tick / app.ticks_per_beat;
                        snd_seq_tick_time_t nearest_beat_tick = floor(beat_pos + 0.5) * app.ticks_per_beat;

                        if (snd_seq_ev_is_real(original_on_ev)) {
                            // Precise timing: Compare event real time to ideal grid real time
                            double tick_ns = (double)app.bpm * app.ticks_per_beat;
                            double ns_per_tick = (60.0 * 1000000000.0) / tick_ns;
                            long long ref_ns = (long long)app.ref_real_time.tv_sec * 1000000000LL + app.ref_real_time.tv_nsec;
                            long long ticks_from_ref_to_beat = (long long)nearest_beat_tick - (long long)app.ref_tick;
                            long long expected_beat_ns = ref_ns + (long long)(ticks_from_ref_to_beat * ns_per_tick);
                            long long actual_event_ns = (long long)original_on_ev->time.time.tv_sec * 1000000000LL + original_on_ev->time.time.tv_nsec;
                            long long ns_offset = actual_event_ns - expected_beat_ns;

                            if (ns_offset > tick_ns / 2 )
                              ns_offset = ns_offset - tick_ns;

                            offset_ms = ns_offset / 1000000LL;
                            double ns_per_beat = ns_per_tick * app.ticks_per_beat;
                            if (ns_per_beat > 0)
                                offset_percent = (double)ns_offset * 100.0 / ns_per_beat;
                        } else {
                            // Fallback to tick-based timing for events that came from the queue
                            long tick_offset = off_ev.time.tick - nearest_beat_tick;
                            double ms_per_tick = (60.0 * 1000.0) / ((double)app.bpm * app.ticks_per_beat);
                            offset_ms = round((double)tick_offset * ms_per_tick);
                            offset_percent = (double)tick_offset * 100.0 / app.ticks_per_beat;
                        }
                    }

                    if (offset_percent > 50) offset_percent = offset_percent - 100;

                    snd_seq_tick_time_t duration_ticks = off_ev.time.tick - start_tick;
                    double duration_beats = (app.ticks_per_beat > 0) ? (double)duration_ticks / app.ticks_per_beat : 0.0;
                    printf("DEBUG: OFF %-4s ch=%2d vel=%3d @ beat %.2f | timing: %+.2f%% (%+ldms) | duration: %.2f beats | auto-terminated by new note \n",
                           note_name_buf, ch, 0, beat_pos, offset_percent, offset_ms, duration_beats);
                }

                // Update state to mark note as off
                app.active_note_start_tick[current_port_idx][ch][nt] = (snd_seq_tick_time_t)-1;
            }
        }
    }
}

static void record_event(const snd_seq_event_t *ev) {
    int port_idx, track_idx;
    struct smf_track *track;
    snd_seq_event_t event_with_tick; // A mutable copy of the event with a guaranteed tick timestamp

    // Filter 1: Must be from our recording queue.
    // We accept both tick and real-time events. The ALSA sequencer is expected
    // to deliver a tick-stamped event from the queue, but in practice, it
    // sometimes only delivers the initial real-time event.
    if (ev->queue != app.queue_id) {
        if (app.debug_mode && ev->type >= SND_SEQ_EVENT_NOTEON && ev->type <= SND_SEQ_EVENT_SYSEX) {
             // printf("    -> REJECTED (Filter 1): Event from queue %d is not our recording queue %d.\n", ev->queue, app.queue_id);
        }
        return;
    }

    // Create a mutable copy of the event and normalize its timestamp to ticks.
    event_with_tick = *ev;
    if (snd_seq_ev_is_tick(ev)) {
        // Event already has a tick timestamp, use it as-is.
        // This is the case for metronome loopback and correctly scheduled MIDI events.
    } else if (snd_seq_ev_is_real(ev)) {
        // This is a "raw" real-time event. We convert its timestamp to a tick
        // value by querying the current state of our recording queue.
        snd_seq_queue_status_t *qstatus;
        snd_seq_queue_status_alloca(&qstatus);
        if (snd_seq_get_queue_status(app.seq, app.queue_id, qstatus) < 0) {
            fprintf(stderr, "Warning: could not get queue status to timestamp a real-time event; event ignored.\n"); fflush(stdout);
            return;
        }
        event_with_tick.time.tick = snd_seq_queue_status_get_tick_time(qstatus);
        if (app.debug_mode) {
             // printf("    -> INFO: Handled real-time event by converting to tick %u\n", event_with_tick.time.tick);
        }
    } else {
        // Event has no timestamp; it cannot be recorded.
        return;
    }


    // Filter 2: Must be destined for one of our recording input ports
    port_idx = -1;
    for (int i = 0; i < app.record_in_count; ++i) {
        if (event_with_tick.dest.port == app.record_in_port_ids[i]) {
            port_idx = i;
            break;
        }
    }
    if (port_idx == -1) {
        if (app.debug_mode && event_with_tick.type >= SND_SEQ_EVENT_NOTEON && event_with_tick.type <= SND_SEQ_EVENT_SYSEX) {
            // printf("    -> REJECTED (Filter 2): Destination port %d is not on the record list.\n", event_with_tick.dest.port);
        }
        return;
    }

    track_idx = port_idx;
    if (app.split_channels) {
        track_idx *= TRACKS_PER_PORT;
        if (snd_seq_ev_is_channel_type(&event_with_tick))
            track_idx += 1 + (event_with_tick.data.note.channel & 0xf);
    }
    if (track_idx >= app.num_tracks) return;

    track = &app.tracks[track_idx];
    track->used = 1;

    // From here on, we use our normalized `event_with_tick` for all processing.
    switch (event_with_tick.type) {
    case SND_SEQ_EVENT_NOTEON:
        if (event_with_tick.data.note.velocity == 0) goto handle_noteoff; // Running status note-off
        if (app.on_switches_others_off) {
            terminate_old_notes(port_idx, ev, &event_with_tick);
        }
        app.active_note_start_tick[port_idx][event_with_tick.data.note.channel & 0xf][event_with_tick.data.note.note & 0x7f] = event_with_tick.time.tick;
        if (app.debug_mode) {
            char note_name_buf[8];
            midi_note_to_name(event_with_tick.data.note.note, note_name_buf, sizeof(note_name_buf));

            double beat_pos = 0.0, offset_percent = 0.0;
            long offset_ms = 0;

            if (app.ticks_per_beat > 0 && app.bpm > 0 && app.queue_time_ref_set) {
                beat_pos = (double)event_with_tick.time.tick / app.ticks_per_beat;
                snd_seq_tick_time_t nearest_beat_tick = floor(beat_pos + 0.5) * app.ticks_per_beat;

                if (snd_seq_ev_is_real(ev)) {
                    // Precise timing: Compare event real time to ideal grid real time
                    double ns_per_tick = (60.0 * 1000000000.0) / ((double)app.bpm * app.ticks_per_beat);
                    long long ref_ns = (long long)app.ref_real_time.tv_sec * 1000000000LL + app.ref_real_time.tv_nsec;
                    long long ticks_from_ref_to_beat = (long long)nearest_beat_tick - (long long)app.ref_tick;
                    long long expected_beat_ns = ref_ns + (long long)(ticks_from_ref_to_beat * ns_per_tick);
                    long long actual_event_ns = (long long)ev->time.time.tv_sec * 1000000000LL + ev->time.time.tv_nsec;
                    long long ns_offset = actual_event_ns - expected_beat_ns;
                    if (ns_offset > ns_per_tick / 2) ns_offset -= ns_per_tick;
                    offset_ms = ns_offset / 1000000LL;
                    offset_percent = (double)ns_offset * 100.0 / ns_per_tick;
                } else {
                    // Fallback to tick-based timing for events that came from the queue
                    long tick_offset = event_with_tick.time.tick - nearest_beat_tick;
                    double ms_per_tick = (60.0 * 1000.0) / ((double)app.bpm * app.ticks_per_beat);
                    offset_ms = round((double)tick_offset * ms_per_tick);
                    if (offset_ms > ms_per_tick)
                      offset_ms -= ms_per_tick;
                    offset_percent = offset_ms / ms_per_tick;
                }
            }

            printf("DEBUG: ON  %-4s ch=%2d vel=%3d @ beat %.2f | timing: %+.2f%% (%+ldms)\n",
                   note_name_buf, event_with_tick.data.note.channel, event_with_tick.data.note.velocity,
                   beat_pos, offset_percent, offset_ms); fflush(stdout);
        }
        delta_time(track, &event_with_tick);
        command(track, 0x90 | (event_with_tick.data.note.channel & 0xf));
        add_byte(track, event_with_tick.data.note.note & 0x7f);
        add_byte(track, event_with_tick.data.note.velocity & 0x7f);
        break;
    case SND_SEQ_EVENT_NOTEOFF:
handle_noteoff:
        if (app.ignore_off)
            return;
        if (app.debug_mode) {
            unsigned char channel = event_with_tick.data.note.channel & 0xf;
            unsigned char note    = event_with_tick.data.note.note & 0x7f;
            snd_seq_tick_time_t start_tick = app.active_note_start_tick[port_idx][channel][note];

            char note_name_buf[8];
            midi_note_to_name(note, note_name_buf, sizeof(note_name_buf));

            double beat_pos = 0.0, offset_percent = 0.0;
            long offset_ms = 0;

            if (app.ticks_per_beat > 0 && app.bpm > 0 && app.queue_time_ref_set) {
                beat_pos = (double)event_with_tick.time.tick / app.ticks_per_beat;
                snd_seq_tick_time_t nearest_beat_tick = floor(beat_pos + 0.5) * app.ticks_per_beat;

                if (snd_seq_ev_is_real(ev)) {
                    // Precise timing: Compare event real time to ideal grid real time
                    double ns_per_tick = (60.0 * 1000000000.0) / ((double)app.bpm * app.ticks_per_beat);
                    long long ref_ns = (long long)app.ref_real_time.tv_sec * 1000000000LL + app.ref_real_time.tv_nsec;
                    long long ticks_from_ref_to_beat = (long long)nearest_beat_tick - (long long)app.ref_tick;
                    long long expected_beat_ns = ref_ns + (long long)(ticks_from_ref_to_beat * ns_per_tick);
                    long long actual_event_ns = (long long)ev->time.time.tv_sec * 1000000000LL + ev->time.time.tv_nsec;
                    long long ns_offset = actual_event_ns - expected_beat_ns;
                    offset_ms = ns_offset / 1000000LL;
                    double ns_per_beat = ns_per_tick * app.ticks_per_beat;
                    if (ns_per_beat > 0)
                        offset_percent = (double)ns_offset * 100.0 / ns_per_beat;
                } else {
                    // Fallback to tick-based timing for events that came from the queue
                    long tick_offset = event_with_tick.time.tick - nearest_beat_tick;
                    double ms_per_tick = (60.0 * 1000.0) / ((double)app.bpm * app.ticks_per_beat);
                    offset_ms = round((double)tick_offset * ms_per_tick);
                    offset_percent = (double)tick_offset * 100.0 / app.ticks_per_beat;
                }
            }

            snd_seq_tick_time_t duration_ticks = 0;
            if (start_tick != (snd_seq_tick_time_t)-1 && event_with_tick.time.tick >= start_tick) {
                duration_ticks = event_with_tick.time.tick - start_tick;
            }
            double duration_beats = (app.ticks_per_beat > 0) ? (double)duration_ticks / app.ticks_per_beat : 0.0;

            printf("DEBUG: OFF %-4s ch=%2d vel=%3d @ beat %.2f | timing: %+.2f%% (%+ldms) | duration: %.2f beats\n",
                   note_name_buf, event_with_tick.data.note.channel, event_with_tick.data.note.velocity,
                   beat_pos, offset_percent, offset_ms, duration_beats); fflush(stdout);
        }
        app.active_note_start_tick[port_idx][event_with_tick.data.note.channel & 0xf][event_with_tick.data.note.note & 0x7f] = (snd_seq_tick_time_t)-1;
        delta_time(track, &event_with_tick);
        command(track, 0x80 | (event_with_tick.data.note.channel & 0xf));
        add_byte(track, event_with_tick.data.note.note & 0x7f);
        add_byte(track, event_with_tick.data.note.velocity & 0x7f);
        break;
    case SND_SEQ_EVENT_PGMCHANGE:
        delta_time(track, &event_with_tick);
        command(track, 0xc0 | (event_with_tick.data.control.channel & 0xf));
        add_byte(track, event_with_tick.data.control.value & 0x7f);
        break;
    case SND_SEQ_EVENT_CONTROLLER:
        delta_time(track, &event_with_tick);
        command(track, 0xb0 | (event_with_tick.data.control.channel & 0xf));
        add_byte(track, event_with_tick.data.control.param & 0x7f);
        add_byte(track, event_with_tick.data.control.value & 0x7f);
        break;
    case SND_SEQ_EVENT_PITCHBEND:
        delta_time(track, &event_with_tick);
        command(track, 0xe0 | (event_with_tick.data.control.channel & 0xf));
        add_byte(track, (event_with_tick.data.control.value + 8192) & 0x7f);
        add_byte(track, ((event_with_tick.data.control.value + 8192) >> 7) & 0x7f);
        break;
    case SND_SEQ_EVENT_SYSEX:
        delta_time(track, &event_with_tick);
        add_byte(track, 0xf0);
        track->last_command = 0;
        var_value(track, event_with_tick.data.ext.len);
        for (unsigned int i = 0; i < event_with_tick.data.ext.len; ++i)
            add_byte(track, ((unsigned char*)event_with_tick.data.ext.ptr)[i]);
        break;
    default:
        break;
    }
}


/* --- Setup and Teardown --- */

static void setup_tracks() {
    app.num_tracks = app.record_in_count;
    if (app.split_channels) app.num_tracks *= TRACKS_PER_PORT;

    app.tracks = calloc(app.num_tracks, sizeof(struct smf_track));
    check_mem(app.tracks);
    for (int i = 0; i < app.num_tracks; ++i)
        app.tracks[i].cur_buf = &app.tracks[i].first_buf;

    app.tracks[0].used = 1; // Track 0 always used for meta events
}

static void write_initial_meta_events() {
    // Tempo
    int usecs_per_quarter = 60000000 / app.bpm;
    var_value(&app.tracks[0], 0);
    add_byte(&app.tracks[0], 0xff); add_byte(&app.tracks[0], 0x51); add_byte(&app.tracks[0], 3);
    add_byte(&app.tracks[0], usecs_per_quarter >> 16);
    add_byte(&app.tracks[0], (usecs_per_quarter >> 8) & 0xff);
    add_byte(&app.tracks[0], usecs_per_quarter & 0xff);

    // Time Signature
    var_value(&app.tracks[0], 0);
    add_byte(&app.tracks[0], 0xff); add_byte(&app.tracks[0], 0x58); add_byte(&app.tracks[0], 4);
    add_byte(&app.tracks[0], app.ts_num);
    add_byte(&app.tracks[0], app.ts_den_pow2);
    add_byte(&app.tracks[0], 24); // MIDI clocks per metronome click
    add_byte(&app.tracks[0], 8);  // 32nd notes per quarter note
}

static void terminate_all_active_notes(void)
{
    if (!app.ignore_off)
        return;

    snd_seq_queue_status_t *qstatus;
    snd_seq_queue_status_alloca(&qstatus);
    check_snd(snd_seq_get_queue_status(app.seq, app.queue_id, qstatus), "get queue status");
    snd_seq_tick_time_t final_tick = snd_seq_queue_status_get_tick_time(qstatus);

    // printf("Terminating any remaining notes at tick %u...\n", final_tick);

    for (int p_idx = 0; p_idx < app.record_in_count; ++p_idx) {
        for (int ch = 0; ch < 16; ++ch) {
            for (int nt = 0; nt < 128; ++nt) {
                snd_seq_tick_time_t start_tick = app.active_note_start_tick[p_idx][ch][nt];
                if (start_tick != (snd_seq_tick_time_t)-1) {

                    int track_idx = p_idx;
                    if (app.split_channels) {
                        track_idx = (p_idx * TRACKS_PER_PORT) + 1 + ch;
                    }
                    if (track_idx >= app.num_tracks) continue;
                    struct smf_track *track = &app.tracks[track_idx];
                    track->used = 1; // Mark track as used if it wasn't already

                    snd_seq_event_t off_ev;
                    snd_seq_ev_clear(&off_ev);
                    off_ev.time.tick = final_tick;

                    delta_time(track, &off_ev);
                    command(track, 0x80 | ch);
                    add_byte(track, nt);
                    add_byte(track, 0);

                    if (app.debug_mode) {
                        char note_name_buf[8];
                        midi_note_to_name(nt, note_name_buf, sizeof(note_name_buf));

                        double beat_pos = 0.0, offset_percent = 0.0;
                        long offset_ms = 0;
                        if (app.ticks_per_beat > 0 && app.bpm > 0 && app.queue_time_ref_set) {
                            beat_pos = (double)off_ev.time.tick / app.ticks_per_beat;
                            // NOTE: Cannot calculate real-time offset as we don't have a real event timestamp.
                            // We fall back to calculating offset from the nearest beat based on ticks alone.
                            long nearest_beat_tick = floor(beat_pos + 0.5) * app.ticks_per_beat;
                            long tick_offset = off_ev.time.tick - nearest_beat_tick;

                            double ms_per_tick = (60.0 * 1000.0) / ((double)app.bpm * app.ticks_per_beat);
                            offset_ms = round((double)tick_offset * ms_per_tick);
                            if (offset_ms > ms_per_tick/ 2) offset_ms -= ms_per_tick;
                            offset_percent = offset_ms / ms_per_tick;
                        }

                        snd_seq_tick_time_t duration_ticks = off_ev.time.tick - start_tick;
                        double duration_beats = (app.ticks_per_beat > 0) ? (double)duration_ticks / app.ticks_per_beat : 0.0;
                        printf("DEBUG: OFF %-4s ch=%2d vel=%3d @ beat %.2f | auto-terminated at exit | timing: %+.2f%% (%+ldms) | duration: %.2f beats\n",
                               note_name_buf, ch, 0, beat_pos, offset_percent, offset_ms, duration_beats); fflush(stdout);
                    }
                }
            }
        }
    }
}

static void finish_tracks() {
    snd_seq_queue_status_t *qstatus;
    snd_seq_queue_status_alloca(&qstatus);
    check_snd(snd_seq_get_queue_status(app.seq, app.queue_id, qstatus), "get queue status");
    snd_seq_tick_time_t tick = snd_seq_queue_status_get_tick_time(qstatus);

    for (int i = 0; i < app.num_tracks; ++i) {
        if (!app.tracks[i].used) continue;
        int diff = tick - app.tracks[i].last_tick;
        if (diff < 0) diff = 0;
        var_value(&app.tracks[i], diff);
        add_byte(&app.tracks[i], 0xff); add_byte(&app.tracks[i], 0x2f); add_byte(&app.tracks[i], 0);
    }
}

static void write_smf_file() {
    int used_tracks = 0, i;
    for (i = 0; i < app.num_tracks; ++i) if (app.tracks[i].used) used_tracks++;

    if (used_tracks == 0) {
        printf("No events recorded, output file will not be created.\n");
        return;
    }

    app.file = fopen(app.output_filename, "wb");
    if (!app.file) fatal("Cannot open %s for writing - %s", app.output_filename, strerror(errno));

    // MThd chunk
    fwrite("MThd\0\0\0\6", 1, 8, app.file);
    fputc(0, app.file); fputc(used_tracks > 1 ? 1 : 0, app.file);
    fputc((used_tracks >> 8) & 0xff, app.file); fputc(used_tracks & 0xff, app.file);
    fputc(app.ticks_per_beat >> 8, app.file); fputc(app.ticks_per_beat & 0xff, app.file);

    // MTrk chunks
    for (i = 0; i < app.num_tracks; ++i) {
        struct smf_track *track = &app.tracks[i];
        if (!track->used) continue;

        fwrite("MTrk", 1, 4, app.file);
        fputc((track->size >> 24) & 0xff, app.file);
        fputc((track->size >> 16) & 0xff, app.file);
        fputc((track->size >> 8) & 0xff, app.file);
        fputc(track->size & 0xff, app.file);

        struct buffer *buf;
        for (buf = &track->first_buf; buf; buf = buf->next)
            fwrite(buf->buf, 1, (buf == track->cur_buf) ? track->cur_buf_size : BUFFER_SIZE, app.file);
    }
    fclose(app.file);
}

static void setup_alsa() {
    snd_seq_port_info_t *pinfo;
    snd_seq_addr_t addr;

    check_snd(snd_seq_open(&app.seq, "default", SND_SEQ_OPEN_DUPLEX, 0), "open sequencer");
    app.client_id = snd_seq_client_id(app.seq);
    check_snd(app.client_id, "get client id");
    check_snd(snd_seq_set_client_name(app.seq, "arecordmidi"), "set client name");

    app.queue_id = snd_seq_alloc_named_queue(app.seq, "arecordmidi queue");
    check_snd(app.queue_id, "create queue");

    snd_seq_port_info_alloca(&pinfo);

    for (int i = 0; i < app.record_in_count; ++i) {
        char port_name[64];
        snprintf(port_name, sizeof(port_name), "Record In %d", i + 1);
        app.record_in_port_ids[i] = snd_seq_create_simple_port(app.seq, port_name,
            SND_SEQ_PORT_CAP_WRITE | SND_SEQ_PORT_CAP_SUBS_WRITE, SND_SEQ_PORT_TYPE_APPLICATION);
        check_snd(app.record_in_port_ids[i], "create record port");

        // Configure the port for timestamping events and scheduling them on our queue
        check_snd(snd_seq_get_port_info(app.seq, app.record_in_port_ids[i], pinfo), "get port info");
        snd_seq_port_info_set_timestamping(pinfo, 1);
        snd_seq_port_info_set_timestamp_real(pinfo, 1);
        snd_seq_port_info_set_timestamp_queue(pinfo, app.queue_id);
        check_snd(snd_seq_set_port_info(app.seq, app.record_in_port_ids[i], pinfo), "configure record port");

        // Connect the external source to our new port using an explicit subscription
        // that specifies the queue. This is more robust than relying on the port's
        // properties alone.
        snd_seq_port_subscribe_t *subs;
        snd_seq_port_subscribe_alloca(&subs);
        check_snd(snd_seq_parse_address(app.seq, &addr, app.record_in_addrs[i]), app.record_in_addrs[i]);

        snd_seq_addr_t my_dest_addr;
        my_dest_addr.client = app.client_id;
        my_dest_addr.port = app.record_in_port_ids[i];

        snd_seq_port_subscribe_set_sender(subs, &addr);
        snd_seq_port_subscribe_set_dest(subs, &my_dest_addr);
        snd_seq_port_subscribe_set_queue(subs, app.queue_id);
        check_snd(snd_seq_subscribe_port(app.seq, subs), "connect record port");
    }

    if (app.use_metronome) {
        app.metronome_out_port_id = snd_seq_create_simple_port(app.seq, "Metronome Out",
            SND_SEQ_PORT_CAP_READ | SND_SEQ_PORT_CAP_SUBS_READ, SND_SEQ_PORT_TYPE_APPLICATION);
        check_snd(app.metronome_out_port_id, "create metronome out port");
        check_snd(snd_seq_parse_address(app.seq, &addr, app.metronome_out_addr), app.metronome_out_addr);
        check_snd(snd_seq_connect_to(app.seq, app.metronome_out_port_id, addr.client, addr.port), "connect metronome port");

        app.metronome_loop_port_id = snd_seq_create_simple_port(app.seq, "Metronome Loop",
            SND_SEQ_PORT_CAP_WRITE | SND_SEQ_PORT_CAP_SUBS_WRITE, SND_SEQ_PORT_TYPE_APPLICATION);
        check_snd(app.metronome_loop_port_id, "create metronome loop port");
        check_snd(snd_seq_connect_from(app.seq, app.metronome_loop_port_id, app.client_id, app.metronome_loop_port_id), "connect metronome loopback");
    }

    if (app.mode == MODE_MASTER) {
        snd_seq_queue_tempo_t *tempo;
        snd_seq_queue_tempo_alloca(&tempo);
        snd_seq_queue_tempo_set_tempo(tempo, 60000000 / app.bpm);
        snd_seq_queue_tempo_set_ppq(tempo, app.ticks_per_beat);
        check_snd(snd_seq_set_queue_tempo(app.seq, app.queue_id, tempo), "set queue tempo");

        app.clock_out_port_id = snd_seq_create_simple_port(app.seq, "Clock Out",
            SND_SEQ_PORT_CAP_READ | SND_SEQ_PORT_CAP_SUBS_READ, SND_SEQ_PORT_TYPE_MIDI_GENERIC);
        check_snd(app.clock_out_port_id, "create clock out port");

        snd_seq_addr_t sender = { .client = SND_SEQ_CLIENT_SYSTEM, .port = SND_SEQ_PORT_SYSTEM_TIMER };
        snd_seq_addr_t dest = { .client = app.client_id, .port = app.clock_out_port_id };
        snd_seq_port_subscribe_t *subs;
        snd_seq_port_subscribe_alloca(&subs);
        snd_seq_port_subscribe_set_sender(subs, &sender);
        snd_seq_port_subscribe_set_dest(subs, &dest);
        snd_seq_port_subscribe_set_queue(subs, app.queue_id);
        snd_seq_port_subscribe_set_time_update(subs, 1);
        check_snd(snd_seq_subscribe_port(app.seq, subs), "subscribe clock out to system timer");

        if (app.clock_out_addr) {
            check_snd(snd_seq_parse_address(app.seq, &addr, app.clock_out_addr), app.clock_out_addr);
            check_snd(snd_seq_connect_to(app.seq, app.clock_out_port_id, addr.client, addr.port), "connect clock out port");
        }
    } else { // MODE_SLAVE
        snd_seq_queue_timer_t *timer;
        snd_seq_queue_timer_alloca(&timer);
        snd_seq_queue_timer_set_type(timer, SND_SEQ_TIMER_ALSA);
        snd_seq_queue_timer_set_id(timer, 0);
        check_snd(snd_seq_set_queue_timer(app.seq, app.queue_id, timer), "set queue timer");

        snd_seq_addr_t sender, dest;
        check_snd(snd_seq_parse_address(app.seq, &sender, app.clock_in_addr), app.clock_in_addr);
        dest.client = SND_SEQ_CLIENT_SYSTEM;
        dest.port = SND_SEQ_PORT_SYSTEM_TIMER;
        snd_seq_port_subscribe_t *subs;
        snd_seq_port_subscribe_alloca(&subs);
        snd_seq_port_subscribe_set_sender(subs, &sender);
        snd_seq_port_subscribe_set_dest(subs, &dest);
        check_snd(snd_seq_subscribe_port(app.seq, subs), "subscribe system timer to external clock");
    }
}

static void list_ports_and_exit() {
    snd_seq_client_info_t *cinfo;
    snd_seq_port_info_t *pinfo;
    snd_seq_t *seq;

    check_snd(snd_seq_open(&seq, "default", SND_SEQ_OPEN_INPUT, 0), "open sequencer for listing");
    snd_seq_client_info_alloca(&cinfo);
    snd_seq_port_info_alloca(&pinfo);

    puts(" Port    Client name                      Port name");
    puts("-----------------------------------------------------------------");

    snd_seq_client_info_set_client(cinfo, -1);
    while (snd_seq_query_next_client(seq, cinfo) >= 0) {
        int client = snd_seq_client_info_get_client(cinfo);
        snd_seq_port_info_set_client(pinfo, client);
        snd_seq_port_info_set_port(pinfo, -1);
        while (snd_seq_query_next_port(seq, pinfo) >= 0) {
            unsigned int caps = snd_seq_port_info_get_capability(pinfo);
            if ((caps & SND_SEQ_PORT_CAP_SUBS_READ) || (caps & SND_SEQ_PORT_CAP_READ)) {
                printf("%3d:%-3d  %-32.32s %s\n",
                    snd_seq_port_info_get_client(pinfo),
                    snd_seq_port_info_get_port(pinfo),
                    snd_seq_client_info_get_name(cinfo),
                    snd_seq_port_info_get_name(pinfo)); fflush(stdout);
            }
        }
    }
    snd_seq_close(seq);
    exit(0);
}

/* --- Main Logic --- */

static void sighandler(int signal) {
    (void)signal;
    app.stop_request = 1;
}

static void help(const char *argv0) {
    fprintf(stderr, "Usage: %s [options] outputfile.mid\n"
        "\nMODES (choose one, --master is default):\n"
        "  --master                   Provide MIDI clock and be the master (default)\n"
        "  --slave                    Receive MIDI clock from another device\n"
        "\nPORT CONFIGURATION:\n"
        "  -p, --midi-in-record=c:p   Add a source port to record from (can be used multiple times)\n"
        "  -m, --midi-out-metronome=c:p Play metronome to this destination port\n"
        "  --midi-in-clock=c:p        In slave mode, receive clock from here\n"
        "  --midi-out-clock=c:p       In master mode, send MIDI clock to here (optional)\n"
        "\nTIMING & RECORDING:\n"
        "  -b, --bpm=beats            Tempo in beats per minute (master mode)\n"
        "  -t, --ticks=ticks          Resolution in ticks per beat (PPQ)\n"
        "  -i, --timesig=nn:dd        Time signature for metronome (e.g., 4:4, 3:4)\n"
        "  -s, --split-channels       Create a separate track for each MIDI channel\n"
        "  --note-recording-on-switches-others-off\n"
        "                             A new note-on event terminates other sounding notes\n"
        "  --note-recording-ignore-off\n"
        "                             Ignore note-off events (implies the above option)\n"
        "\nMETRONOME TWEAKS:\n"
        "  --compensate-metronome-output-latency-ms=<ms> Send metronome notes early\n"
        "\nOTHER OPTIONS:\n"
        "  -h, --help                 This help\n"
        "  -V, --version              Show version\n"
        "  -l, --list                 List available MIDI ports\n"
        "  --debug                    Output recorded events to the console\n",
        argv0);
}

static void parse_time_signature(const char *arg) {
    char *sep;
    app.ts_num = strtol(arg, &sep, 10);
    if (app.ts_num < 1 || app.ts_num > 64 || (*sep != ':' && *sep != '/'))
        fatal("Invalid time signature numerator: %s", arg);

    app.ts_den = strtol(++sep, NULL, 10);
    if (app.ts_den < 1 || (app.ts_den & (app.ts_den - 1)) != 0) // Must be power of 2
        fatal("Invalid time signature denominator (must be power of 2): %s", arg);

    app.ts_den_pow2 = 0;
    for (int x = app.ts_den; x > 1; x /= 2)
        ++app.ts_den_pow2;
}

static void validate_args() {
    if (app.mode == MODE_UNSPECIFIED) app.mode = MODE_MASTER;
    if (app.record_in_count == 0) fatal("Please specify at least one source port with -p or --midi-in-record.");
    if (app.mode == MODE_SLAVE && !app.clock_in_addr) fatal("Slave mode requires --midi-in-clock.");
    if (app.mode == MODE_MASTER && app.clock_in_addr) fatal("--midi-in-clock can only be used in slave mode.");
    if (app.mode == MODE_SLAVE && app.clock_out_addr) fatal("--midi-out-clock can only be used in master mode.");
    if (app.use_metronome && !app.metronome_out_addr) fatal("Using metronome requires specifying --midi-out-metronome.");
    if (app.metro_latency_ms > 0) {
        double ticks_per_ms = (app.bpm / 60.0 * app.ticks_per_beat) / 1000.0;
        app.metro_tick_offset = (snd_seq_tick_time_t)(app.metro_latency_ms * ticks_per_ms);
    }
    if (app.ignore_off) {
        app.on_switches_others_off = 1;
    }
}

int main(int argc, char *argv[]) {
    app.mode = MODE_UNSPECIFIED;
    app.bpm = 120; app.ticks_per_beat = 384;
    app.ts_num = 4; app.ts_den = 4; app.ts_den_pow2 = 2; // Default 4/4
    app.metro_channel = 9; app.metro_strong_note = 34; app.metro_weak_note = 33; app.metro_velocity = 100;
    app.queue_time_ref_set = 0;

    static const struct option long_options[] = {
        {"help", 0, NULL, 'h'}, {"version", 0, NULL, 'V'}, {"list", 0, NULL, 'l'},
        {"master", 0, NULL, 1000}, {"slave", 0, NULL, 1001},
        {"midi-in-record", 1, NULL, 'p'}, {"midi-out-metronome", 1, NULL, 'm'},
        {"midi-in-clock", 1, NULL, 1002}, {"midi-out-clock", 1, NULL, 1003},
        {"bpm", 1, NULL, 'b'}, {"ticks", 1, NULL, 't'}, {"timesig", 1, NULL, 'i'},
        {"split-channels", 0, NULL, 's'},
        {"debug", 0, NULL, 1004},
        {"compensate-metronome-output-latency-ms", 1, NULL, 1005},
        {"note-recording-on-switches-others-off", 0, NULL, 1006},
        {"note-recording-ignore-off", 0, NULL, 1007},
        {0}
    };

    int c;
    while ((c = getopt_long(argc, argv, "hVlp:m:b:t:i:s", long_options, NULL)) != -1) {
        switch (c) {
        case 'h': help(argv[0]); return 0;
        case 'V': fputs("arecordmidi version " SND_UTIL_VERSION_STR "\n", stderr); return 0;
        case 'l': list_ports_and_exit(); break;
        case 1000: if (app.mode != MODE_UNSPECIFIED) fatal("--master and --slave are mutually exclusive."); app.mode = MODE_MASTER; break;
        case 1001: if (app.mode != MODE_UNSPECIFIED) fatal("--master and --slave are mutually exclusive."); app.mode = MODE_SLAVE; break;
        case 'p': if (app.record_in_count >= MAX_PORTS) fatal("Too many --midi-in-record ports (max %d)", MAX_PORTS); app.record_in_addrs[app.record_in_count++] = optarg; break;
        case 'm': app.metronome_out_addr = optarg; app.use_metronome = 1; break;
        case 1002: app.clock_in_addr = optarg; break;
        case 1003: app.clock_out_addr = optarg; break;
        case 'b': app.bpm = atoi(optarg); break;
        case 't': app.ticks_per_beat = atoi(optarg); break;
        case 'i': parse_time_signature(optarg); break;
        case 's': app.split_channels = 1; break;
        case 1004: app.debug_mode = 1; break;
        case 1005: app.metro_latency_ms = atol(optarg); break;
        case 1006: app.on_switches_others_off = 1; break;
        case 1007: app.ignore_off = 1; break;
        default: help(argv[0]); return 1;
        }
    }

    if (optind >= argc) fatal("Please specify an output file name.");
    app.output_filename = argv[optind];
    validate_args();

    // Initialize the active note tracker for debug output
    memset(app.active_note_start_tick, -1, sizeof(app.active_note_start_tick));

    setup_alsa();
    setup_tracks();
    write_initial_meta_events();

    if (app.mode == MODE_MASTER) {
        printf("Master mode: Starting recording at %d BPM.\n", app.bpm);
        check_snd(snd_seq_start_queue(app.seq, app.queue_id, NULL), "start queue");
        // For debug timing, get a reliable reference time from ALSA itself
        // immediately after starting the queue. This avoids clock source mismatches.
        if (app.debug_mode) {
            snd_seq_queue_status_t *qstatus;
            snd_seq_queue_status_alloca(&qstatus);
            check_snd(snd_seq_get_queue_status(app.seq, app.queue_id, qstatus), "get queue status for time ref");
            app.ref_tick = snd_seq_queue_status_get_tick_time(qstatus);
            app.ref_real_time = *snd_seq_queue_status_get_real_time(qstatus);
            app.queue_time_ref_set = 1;
        }
        start_metronome();
    } else {
        printf("Slave mode: Waiting for MIDI clock from %s...\n", app.clock_in_addr);
        snd_seq_control_queue(app.seq, app.queue_id, SND_SEQ_EVENT_START, 0, NULL);
    }

    signal(SIGINT, sighandler);
    signal(SIGTERM, sighandler);
    printf("Recording to '%s'. Press Ctrl+C to stop.\n", app.output_filename);

    int npfds = snd_seq_poll_descriptors_count(app.seq, POLLIN);
    struct pollfd *pfds = alloca(sizeof(*pfds) * npfds);

    while (!app.stop_request) {
        snd_seq_poll_descriptors(app.seq, pfds, npfds, POLLIN);
        if (poll(pfds, npfds, 1000) < 0 && errno != EINTR) break;

        snd_seq_event_t *ev;
        while (snd_seq_event_input(app.seq, &ev) > 0 && !app.stop_request) {
            if (app.debug_mode) {
//                 printf("INPUT EVENT: type=%-3d src=%-3d:%-3d dest=%-3d:%-3d queue=%-3d ",
//                        ev->type,
//                        ev->source.client, ev->source.port,
//                        ev->dest.client, ev->dest.port,
//                        ev->queue);
                if (snd_seq_ev_is_tick(ev)) {
                    // printf("time=tick:%u\n", ev->time.tick);
                } else if (snd_seq_ev_is_real(ev)) {
                    // printf("time=real:%ld.%09ld\n", (long)ev->time.time.tv_sec, (long)ev->time.time.tv_nsec);
                } else {
                    // printf("time=none\n");
                }
            }

            // Handle slave mode start, which starts the queue
            if (ev->type == SND_SEQ_EVENT_START && app.mode == MODE_SLAVE) {
                printf("Received MIDI Start. Starting recording and metronome.\n");
                if (app.debug_mode && !app.queue_time_ref_set) {
                    app.ref_tick = ev->time.tick; // should be 0
                    app.ref_real_time = ev->time.time;
                    app.queue_time_ref_set = 1;
                }
                start_metronome();
            }

            // Handle metronome loopback event
            if (app.use_metronome && ev->dest.port == app.metronome_loop_port_id && ev->type == SND_SEQ_EVENT_USR0) {
                metronome_pattern(ev->time.tick);
            }

            // Attempt to record any other event. The function itself will filter.
            record_event(ev);

            snd_seq_free_event(ev);
        }
    }

    printf("\nRecording stopped. Finalizing file...\n");
    terminate_all_active_notes();
    finish_tracks();
    write_smf_file();

    for (int i = 0; i < app.num_tracks; ++i) {
        struct buffer *b = app.tracks[i].first_buf.next, *next;
        while (b) {
            next = b->next;
            free(b);
            b = next;
        }
    }
    free(app.tracks);

    snd_seq_close(app.seq);
    printf("Done.\n");

    return 0;
}
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/307
Repository URL: https://github.com/alsa-project/alsa-utils
